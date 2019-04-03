��          �            h    i  �   q  �   `  w  1  �   �  &  �  8  �    �    
  �   /  �   �  �  \  5     C   T  {  �  �     �     �   �  w  �  �   =    ,    D    U  �   k  �   i  �     �  �  5   X  C   �                  
                                                          	    
    AVANTPY EXCEPTION: IfNobreakError

    Error found in file '{filename}' on line {nobreak_linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy {nobreak_kwd} keyword cannot be used in
    an IF/ELIF/ELSE clause (Python: if/elif/else).

 
    AVANTPY EXCEPTION: MismatchedBracketsError

    Error found in file '{filename}' on lines [{begin} - {end}].

    Dialect used: {dialect}

{partial_source}

    The opening {open_bracket} does not match the closing {close_bracket}.

 
    AVANTPY EXCEPTION: MissingLeftBracketError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The closing {bracket} does not match anything.

 
    AVANTPY EXCEPTION: MissingRepeatColonError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    A statement beginning with the '{repeat_kwd}' keyword must be on a single
    line ending with a colon (:) that indicates the beginning of an indented
    block of code, with no other colon appearing on that line.

 
    AVANTPY EXCEPTION: MissingRepeatError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{keyword}'' keyword can be used only when preceded by '{repeat_kwd}'.

 
    AVANTPY EXCEPTION: NobreakFirstError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword can be used instead of ELSE
    (Python: else) only when it begins a new statement in FOR/WHILE loops.

 
    AVANTPY EXCEPTION: NobreakSyntaxError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword can only be used as a replacement
    of ELSE (Python: else) with a matching FOR or WHILE loop
    (Python: for/while).

 
    AVANTPY EXCEPTION: RepeatFirstError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{repeat_kwd}' keyword can only be used to begin
    a new loop (Python: equivalent to 'for' or 'while' loop).

 
    AVANTPY EXCEPTION: TryNobreakError

    Error found in file '{filename}' on line {nobreak_linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword cannot be used in
    a TRY/EXCEPT/ELSE/FINALLY clause (Python: try/except/else/finally).

 
    AVANTPY EXCEPTION: UnknownDialectError

    The following unknown dialect was requested: {dialect}.

    The known dialects are: {all_dialects}.

 
    AVANTPY EXCEPTION: UnknownLanguageError

    The following unknown language was requested: {lang}.

    The known languages are: {all_langs}.

 
    PYTHON EXCEPTION: {python_display}

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    A NameError exception indicates that a variable or
    function name is not known to Python.
    Most often, this is because there is a spelling mistake; however,
    sometimes it is because it is used before being defined or given a value.
    In your program, the unknown name is '{var_name}'.

     ==> LANGUAGE: {lang} | AVANTPY DIALECT: {dialect} An exception was raised for which we have no simplified traceback:
 Project-Id-Version: 
POT-Creation-Date: 2019-04-03 07:12-0300
PO-Revision-Date: 2019-04-03 07:22-0300
Last-Translator: André Roberge <andre.roberge@gmail.com>
Language-Team: 
Language: en
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: pygettext.py 1.5
X-Generator: Poedit 2.2.1
Plural-Forms: nplurals=2; plural=(n != 1);
 
    AvantPy exception: IfNobreakError

    Error found in file '{filename}' on line {nobreak_linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy {nobreak_kwd} keyword cannot be used in
    an if/elif/else clause.

 
    AvantPy exception: MismatchedBracketsError

    Error found in file '{filename}' on lines [{begin} - {end}].

    Dialect used: {dialect}

{partial_source}

    The opening {open_bracket} does not match the closing {close_bracket}.

 
    AvantPy exception: MissingLeftBracketError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The closing {bracket} does not match anything.

 
    AvantPy exception: MissingRepeatColonError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    A statement beginning with the '{repeat_kwd}' keyword must be on a single
    line ending with a colon (:) that indicates the beginning of an indented
    block of code, with no other colon appearing on that line.

 
    AvantPy exception: MissingRepeatError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{keyword}' keyword can be used only when preceded by '{repeat_kwd}'.

 
    AvantPy exception: NobreakFirstError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword can be used instead of else
    only when it begins a new statement in for/while loops.

 
    AvantPy exception: NobreakSyntaxError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword can only be used as a replacement
    of else with a matching for or while loop

 
    AvantPy exception: RepeatFirstError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{repeat_kwd}' keyword can only be used to begin
    a new loop (Python: equivalent to 'for' or 'while' loop).

 
    AvantPy exception: TryNobreakError

    Error found in file '{filename}' on line {nobreak_linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword cannot be used in
    a try/except/else/finally clause.

 
    AvantPy exception: UnknownDialectError

    The following unknown dialect was requested: {dialect}.

    The known dialects are: {all_dialects}.

 
    AvantPy exception: UnknownLanguageError

    The following unknown language was requested: {lang}.

    The known languages are: {all_langs}.

 
    Python exception: {python_display}

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    A NameError exception indicates that a variable or
    function name is not known to Python.
    Most often, this is because there is a spelling mistake; however,
    sometimes it is because it is used before being defined or given a value.
    In your program, the unknown name is '{var_name}'.

     ==> Language: {lang} | AvantPy dialect: {dialect} An exception was raised for which we have no simplified traceback:
 