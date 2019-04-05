��          �      ,      �    �  �   �  �   �  w  g  �   �  T  �  P  $    u	  =  �
  �   �  �   a  �  �  5   �  C   �     2  :   L  z  �  S      V  �   h  �  e  *  3  �  ^  �  �  g  �  p  �  �   c  �     �  �  6   +!  Z   b!  9   �!  A   �!                     	   
                                                      
    AvantPy exception: IfNobreakError

    Error found in file '{filename}' on line {nobreak_linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword cannot be used in
    an '{if_kwd}/{elif_kwd}/{else_kwd}' clause (Python: if/elif/else).

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

    The AvantPy '{keyword}'' keyword can be used only when preceded by '{repeat_kwd}'.

 
    AvantPy exception: NobreakFirstError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword can be used instead of '{else_kwd}'
    (Python: else) only when it begins a new statement in
    '{for_kwd}/{while_kwd}' loops (Python: for/while).

 
    AvantPy exception: NobreakSyntaxError

    Error found in file '{filename}' on line {linenumber}.

    Dialect used: {dialect}

{partial_source}

    The AvantPy '{nobreak_kwd}' keyword can only be used as a replacement
    of '{else_kwd}' (Python: else) with a matching '{for_kwd}' or
    '{while_kwd}' loop (Python: for/while).

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
    a '{try_kwd}/{except_kwd}/{else_kwd}/{finally_kwd}' clause
    (Python: try/except/else/finally).

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
 Cannot find main module:  UNHANDLED EXCEPTION in console.py. This should not happen. Project-Id-Version: 
POT-Creation-Date: 2019-04-05 16:24-0300
PO-Revision-Date: 2019-04-05 16:25-0300
Last-Translator: André Roberge <andre.roberge@gmail.com>
Language-Team: 
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: pygettext.py 1.5
X-Generator: Poedit 2.2.1
Plural-Forms: nplurals=2; plural=(n > 1);
 
    Exception AvantPy : IfNobreakError

    Erreur trouvée dans le fichier '{filename}' à la ligne {nobreak_linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Le mot-clé '{nobreak_kwd}' spécifique à Avantpy ne peut pas être utilisé
    dans un énoncé '{if_kwd}/{elif_kwd}/{else_kwd}' (Python: if/elif/else).

 
    Exception AvantPy : MismatchedBracketsError

    Erreur trouvée dans le fichier '{filename}' aux lignes [{begin} - {end}].

    Dialecte utilisé : {dialect}

{partial_source}

    Le symbole gauche {open_bracket} ne correspond pas au symbole droit {close_bracket}.

 
    Exception AvantPy : MissingLeftBracketError

    Erreur trouvée dans le fichier '{filename}' à la ligne {linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Le symbole droit {bracket} n'a pas de symbole gauche correspondant.

 
    Exception AvantPy : RepeatFirstError

    Erreur trouvée dans le fichier '{filename}' à la ligne {linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Un énoncé débutant avec le mot clé '{repeat_kwd}' spécifique à Avantpy
    doit être sur une seule ligne terminant avec deux points (:) qui indiquent
    le début d'un bloc de code de code indenté, sans qu'il n'y ait
    d'autre deux points qui apparaissent sur cette ligne.

 
    Exception AvantPy : MissingRepeatError

    Erreur trouvée dans le fichier '{filename}' à la ligne {linenumber}.

    Dialecte utilisé: {dialect}

{partial_source}

    Le mot-clé '{keyword}' spécifique à Avantpy peut seulement être utilisé
    s'il est précédé de '{repeat_kwd}'.

 
    Exception AvantPy : NobreakFirstError

    Erreur trouvée dans le fichier '{filename}' à la ligne {linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Le mot-clé '{nobreak_kwd}' spécifique à Avantpy peut seulement être utilisé
    au lieu de sinon (Python: else) lorsqu'il débute un nouvel énoncé
    dans des boucles '{for_kwd}' ou '{while_kwd}' (Python: for/while).

 
    Exception AvantPy : IfNobreakError

    Erreur trouvée dans le fichier '{filename}' à la ligne {linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Le mot-clé '{nobreak_kwd}' spécifique à Avantpy peut seulement être utilisé
    au lieu de '{else_kwd}' (Python: else) lorsqu'il débute un nouvel énoncé
    dans des boucles '{for_kwd}' ou '{while_kwd}' (Python: for/while).

 
    Exception AvantPy : RepeatFirstError

    Erreur trouvée dans le fichier '{filename}' à la ligne {linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Le mot-clé '{repeat_kwd}' spécifique à Avantpy peut seulement être utilisé
    pour débuter une nouvelle boucle 'pour' ou 'tantque'
    (équivalent Python: 'for' ou 'while').

 
    Exception AvantPy : TryNobreakError

    Erreur trouvée dans le fichier '{filename}' à la ligne {nobreak_linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Le mot-clé '{nobreak_kwd}' spécifique à Avantpy ne peut pas être utilisé dans
    un énoncé '{try_kwd}/{except_kwd}/{else_kwd}/{finally_kwd}' (Python: try/except/else/finally).

 
    Exception AvantPy : UnknownDialectError

    Le dialecte inconnu suivant a été demandé : {dialect}.

    Les dialectes connus sont : {all_dialects}.

 
    Exception AvantPy : UnknownLanguageError

    Le langage inconnu suivant a été demandé : {lang}.

    Les langages connus sont : {all_langs}.

 
    Exception Python : {python_display}

    Erreur trouvée dans le fichier '{filename}' à la ligne {linenumber}.

    Dialecte utilisé : {dialect}

{partial_source}

    Une exception de type NameError indique que le nom d'une variable
    ou d'une fonction utilisée dans votre programme est inconnu par Python.
    Le plus souvent, ceci se produit parce que vous faites une faute
    d'orthographe dans l'écriture de votre variable ou de votre fonction;
    ceci peut également se produire si vous invoquez cette fonction ou utilisez
    cette variable sans l'avoir définie auparavant.
    Dans votre programme, le nom inconnu est '{var_name}'.

     ==> Langue : {lang} | dialecte AvantPy : {dialect} Une exception pour laquelle nous n'avons pas de traceback simplifiée a été soulevée :
 Le module principal ('main') ne peut pas être trouvé :  Exception imprévue dans console.py. Ceci ne devrait pas arriver. 