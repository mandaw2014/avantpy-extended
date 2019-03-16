"""translations: upper.py


This file can be used as a template for translations in other languages.
"""

# Note: as a reminder that these are the error messages from the upper(case)
# dialect, we begin them with the all-caps words AVANTPY EXCEPTION or
# PYTHON EXCEPTION

upper = {
    "IfNobreakError": """
    AVANTPY EXCEPTION: IfNobreakError\n
    Error found in file {filename} on line {nobreak_linenumber}.\n
    Dialect used: {dialect}\n
{partial_source}

    The AvantPy {nobreak_kwd} keyword cannot be used in
    an IF/ELIF/ELSE clause (Python: if/elif/else).
""",
    "NobreakFirstError": """
    AVANTPY EXCEPTION: NobreakFirstError\n
    Error found in file {filename} on line {linenumber}.\n
    Dialect used: {dialect}\n
{partial_source}

    The AvantPy {nobreak_kwd} keyword can be used instead of ELSE (Python: else)
    only when it begins a new statement for loops.
""",
    "NobreakSyntaxError": """
    AVANTPY EXCEPTION: NobreakFirstError\n
    Error found in file {filename} on line {linenumber}.\n
    Dialect used: {dialect}\n
{partial_source}

    The AvantPy {nobreak_kwd} keyword can only be used as a replacement
    of ELSE (Python: else) with a matching FOR or WHILE loop
    (Python: for/while).
""",
    "RepeatFirstError": """
        AVANTPY EXCEPTION: RepeatFirstError\n
        The AvantPy {repeat_kwd} keyword must begin a new statement.\n
        Error found in file {filename} on line {linenumber}.\n
            Line {linenumber}: {repeat_line}
    """,
    "TryNobreakError": """
    AVANTPY EXCEPTION: TryNobreakError\n
    Error found in file {filename} on line {nobreak_linenumber}.\n
    Dialect used: {dialect}\n
{partial_source}

    The AvantPy {nobreak_kwd} keyword cannot be used in
    a TRY/EXCEPT/ELSE/FINALLY clause (Python: try/except/else/finally).
""",
}
