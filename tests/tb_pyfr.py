"""Creates a version of traceback_xx.rst to insert in the documentation.
"""

# When creating a new dialect, you need to:
# 1. Make a copy of this file
# 2. Change the value of LANG as well as 'content' so that they reflect the
#    appropriate language
# 3. Make a version of all the raise_some_exception tests in that dialect;
#    this is more easily done using a custom script which you should find
#    in the documentation

import os
import sys
import platform

LANG = "fr"

# Make it possible to find docs and tests source
this_dir = os.path.dirname(__file__)
root_dir = os.path.abspath(os.path.join(this_dir, ".."))
test_dir = os.path.abspath(os.path.join(this_dir, f"py{LANG}"))

sys.path.insert(0, root_dir)

# set up import hook
import avantpy  # noqa

sys.path.insert(0, this_dir)
sys.path.insert(0, test_dir)
os.chdir(test_dir)

import tb_common  # noqa

target = os.path.normpath(os.path.join(root_dir, f"docs/source/tracebacks_{LANG}.rst"))

intro_text = """
Friendly error messages - en Français
======================================

Un des buts d'AvantPy est de fournir des rétroactions plus conviviales
que les fameux *tracebacks* de Python lorsqu'une exception survient.
Ci-dessous, on peut voir quelques exemples. Le but éventuel est de
documenter ici tous les exemples possibles tels qu'interprétés par AvantPy.

.. note::

     Le contenu de cette page a été généré par l'exécution de
     {name} situé dans le répertoire ``tests/``.
     Ceci a besoin d'être fait de manière explicite lorsqu'on veut
     faire des corrections ou des ajouts, avant de faire la mise
     à jour du reste de la documentation avec Sphinx.

AvantPy version: {avantpy}
Python version: {python}

""".format(
    avantpy=avantpy.version.__version__, python=platform.python_version(), name=__file__
)


tb_common.create_tracebacks(target, intro_text)
