"""conversion.py

Keeps track of available dialects, and perform require code transformations.

.. warning::

   This module is currently very poorly documented.

"""
import glob
import os.path
import runpy
import tokenize
from io import StringIO


DEBUG = False


def set_debug(val=True):
    """Used to set DEBUG to either True or False, 
       with True being the default value.

       Returns: The current value of DEBUG
    """
    global DEBUG
    DEBUG = val
    return DEBUG


class _State:
    """Keeping track of parameters which control some of the
       behaviour of AvantPy."""

    def __init__(self):
        self.dictionaries = {}
        self.all_count_names = []
        self.current_dialect = None
        self.collect_dialects()

    def all_dialects(self):
        """Returns a list of all known dialects."""
        return [k for k in self.dictionaries.keys() if k.startswith("py")]

    def collect_dialects(self):
        """Find known dialects and create corresponding dictionaries"""
        dialects = glob.glob(os.path.dirname(__file__) + "/dialects/*.py")
        for f in dialects:
            if os.path.isfile(f) and not f.endswith("__init__.py"):

                lang = os.path.basename(f).split(".")[0]
                dialect = "py" + lang

                _module = runpy.run_path(f)
                from_py = _module[lang]
                self.add_translation(lang, from_py)

                to_py = {}
                for k, v in from_py.items():
                    if isinstance(v, str):
                        to_py[v] = k
                    else:
                        for val in v:
                            to_py[val] = k
                self.add_translation(dialect, to_py)

    def is_dialect(self, dialect):
        """Returns True if `dialect` is a known dialect, False otherwise."""
        return dialect.startswith("py") and dialect in self.dictionaries

    def is_lang(self, lang):
        """Returns True if `lang` is known as part of a dialect, False otherwise"""
        return (not lang.startswith("py")) and lang in self.dictionaries

    def add_translation(self, name, translation_dict):
        """Adds a translation dict either from a dialect to Python
           or from Python to a given dialect.
        """
        self.dictionaries[name] = translation_dict

    def get_to_python(self, dialect):
        """Returns a dict providing translation from a dialect into Python"""
        assert self.is_dialect(dialect)
        return self.dictionaries[dialect]

    def get_from_python(self, dialect):
        """Returns a dict providing translation from Python into a dialect"""
        lang = dialect[2:]
        assert self.is_lang(lang)
        return self.dictionaries[lang]

    def get_unique_variable_names(self, source, repeat_kwd):
        """Returns a list of possible variables names that
           are not found in the original source and have not been used
           anywhere.
           These variables will be used in expressions such as

               for _COUNT_42 in range(n):

           which will replace

               repeat n:
        """
        nb = source.count(repeat_kwd)
        if nb == 0:
            return []

        base_name = "_COUNT_"
        var_names = []
        i = 0
        j = 0
        while j < nb:
            tentative_name = base_name + str(i)
            if (
                source.count(tentative_name) == 0
                and tentative_name not in self.all_count_names
            ):
                var_names.append(tentative_name)
                self.all_count_names.append(tentative_name)
                j += 1
            i += 1
        return var_names


__state = _State()


def all_dialects():
    """Returns a list of all known dialects."""
    return __state.all_dialects()


def is_dialect(dialect):
    """Returns True if `dialect` is a known dialect, False otherwise."""
    return __state.is_dialect(dialect)


def get_dialect():
    """Returns the current dialect being used."""
    return __state.current_dialect


def set_dialect(dialect=None):
    """Sets the dialect to be used.

    Valid values are of the form "pyXX" where XX denotes a valid two-letter
    language code.  
    If `dialect` is not recognized as being valid, an error message is
    printed.
    """
    if dialect is None:
        return __state.current_dialect
    elif is_dialect(dialect):
        __state.current_dialect = dialect
    else:
        print("Unknown dialect: ", dialect)


def set_lang(lang):
    """Sets the language and/or Python dialect to be used.
    
    Valid values are typically two-letter language code such as 'en' or 'fr'.

    If `lang` is not a recognized language, an error message is printed.
    """
    # Since this function can be used in the console, in order to make it
    # more user friendly, we accept values that start with 'py' such as
    # 'pyfr' as being equivalent to their two-letter language counterpart

    if lang.startswith("py"):
        dialect = lang
    else:
        dialect = "py" + lang

    if is_dialect(dialect):
        set_dialect(dialect)
        if DEBUG:
            print("lang %s selected" % lang)
        return
    print("Unknown language: ", lang)


def to_python(source, dialect=None):
    """Converts a source in a known dialect into standard Python.

    To understand how this function works, it is useful to review
    all possible cases, from the more complex ones to the
    simplest.

    A. repeat

    In addition to the standard Python loops constructs, AvantPy
    support four additional idioms:

    1. ``repeat forever:``           # while True:
    2. ``repeat while condition:``   # while condition:
    3. ``repeat until condition:``   # while not condition:
    4. ``repeat n:``                 # for some_var in range(n):

    For this last case, 'n' could be an expression, possibly
    spanning multiple lines.

    When we encounter the equivalent to the "repeat" keyword in
    the selected dialect, we must make sure that it is the first
    keyword occurring on a logical line; if not, we include a
    statement raising a SyntaxError with an appropriate message
    and ignore the rest of the code since it would be irrelevant
    when the script is executed.

    If "repeat" is the first keyword on a line, we set a flag
    (repeat_loop) to True, preparing to look at the next token.

    a) If the next token is one of "forever", "until", "while",
    or their equivalent in the target dialect
    (remember that including normal Python keywords in a program written
    in a different dialect is allowed)
    we can proceed with the rest in a straightforward manner.

    b) if that is not the case, we set a different flag (repeat_n)
    to True so that we can deal with the relevant for loop.

    For this last case, the variable in the for loop is a dummy
    variable; we must ensure that its name is chosen such that
    it does not occur anywhere else in the source code.

    B. nobreak

    The next case we need to consider is the "nobreak" keyword.


    C. Direct translation

    Next is the simple translation of keywords from the dialect
    to standard Python

    D. Remaining tokens

    Any remaining token is left as is; it is assumed to be valid
    Python.

    E. Spaces between tokens

    Programs can be run with the --diff option to show the difference 
    between the code written and standard Python. In order to minimize
    the number of differences shown, we keep the spacing between
    tokens the same.  While we use Python tokenize to break the code
    into tokens, Python's untokenize cannot be used without risking
    to change the spaces in the original code. We thus have our
    own method to keep track of such spacing.
    """
    dialect = set_dialect(dialect)
    if not is_dialect(dialect):
        return source

    lang_to_py = __state.get_to_python(dialect)
    py_to_lang = __state.get_from_python(dialect)

    repeat_kwd = py_to_lang["repeat"]
    while_kwd = py_to_lang["while"]
    until_kwd = py_to_lang["until"]
    forever_kwd = py_to_lang["forever"]
    loops_with_else = ["for", "while", py_to_lang["for"], while_kwd]
    blocks_with_else = [
        "if",
        "elif",
        py_to_lang["if"],
        py_to_lang["elif"],
    ] + loops_with_else
    nobreak_kwd = py_to_lang["else"][1]

    # custom error messages
    if_nobreak_disallowed = (
        "%s is not allowed as a block with an if statement" % nobreak_kwd
    )
    repeat_must_be_first = "%s must be the first keyword on a given line." % repeat_kwd

    # variable names to be used in
    #    for variable_name in range(...):
    var_names = __state.get_unique_variable_names(source, repeat_kwd)

    # some book-keeping variables used in the for-loop below
    result = []
    prev_lineno = -1
    prev_col = 0
    repeat_loop = False
    repeat_n = False
    begin_new_line = True

    # In order to determine what to do with the nobreak keyword,
    # we keep track of which one among if/while/for and their translation
    # in a given dialect last appeared in a given column
    # format: indentation[column] = keyword
    indentations = {}

    toks = tokenize.generate_tokens(StringIO(source).readline)

    for _, tok_str, start, end, _ in toks:
        if not tok_str.strip(" "):  # we keep track of spacing elsewhere
            continue

        start_line, start_col = start
        end_line, end_col = end
        begin_new_line = start_line != prev_lineno

        # We ensure spacing of original file is preserved,
        # including space between tokens.
        # When repeat_loop is True, it means we just saw the repeat keyword
        # which can simply be dropped; we don't need add the space
        # between "repeat" and the next token.
        if not repeat_loop:
            if start_line > prev_lineno:
                prev_col = 0
            if start_col > prev_col and tok_str != "\n":
                result.append(" " * (start_col - prev_col))
        prev_col = end_col
        prev_lineno = end_line

        # keeping track of beginning of for/while/if block so that
        # we can tell if replacing 'nobreak' by 'else' makes sense.
        if begin_new_line:
            if tok_str in blocks_with_else:
                indentations[start_col] = tok_str
            elif tok_str == repeat_kwd:
                # even though no one should be taught to use nobreak
                # with such loops, it would be consistent with normal Python
                # syntax; hence, we keep track of it, arbitrarily using 'for'
                # as the keyword: the only important thing is that it is not 'if'
                indentations[start_col] = "for"

        # ===== Potential substitutions are done in if/elif/.../else clause

        if tok_str == repeat_kwd:
            if not begin_new_line:  # this is not allowed to happen
                result.append(tok_str)
                msg = repeat_must_be_first
                result.append('\nraise SyntaxError("%s")' % msg)
                break
            repeat_loop = True

        elif repeat_loop:
            repeat_loop = False
            if tok_str in [while_kwd, until_kwd, forever_kwd]:
                if tok_str == while_kwd:
                    result.append("while")
                elif tok_str == until_kwd:
                    result.append("while not")
                else:
                    result.append("while True")
            else:
                repeat_n = True
                result.append("for %s in range(" % var_names.pop())
                result.append(tok_str)

        elif repeat_n and tok_str == ":":
            result.append("):")
            repeat_n = False

        elif tok_str in lang_to_py:
            if tok_str == nobreak_kwd:
                if (
                    begin_new_line
                    and start_col in indentations
                    and indentations[start_col] in loops_with_else
                ):
                    result.append("else")
                else:
                    result.append("# " + tok_str)
                    msg = if_nobreak_disallowed
                    result.append('\nraise SyntaxError("%s")' % msg)
                    break
            else:
                result.append(lang_to_py[tok_str])

        else:
            result.append(tok_str)

    source = "".join(result)
    if DEBUG:
        print(source)
    return source
