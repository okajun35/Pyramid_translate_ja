Þ    ?                      $    ;   2    n       0     *  Á     ì  V   	  7   `  Í         f	  E   	  .   Í	  M   ü	  7   J
  @   
     Ã
  #  P  b   t  Õ   ×     ­  ,   Ç     ô     	  *        A  
   I     T  é   m  2   W               ¢  l   °  +        I  _   _  ¦   ¿  '   f  }     ð        ý  9     2   Ð  Õ        Ù  2   _  "     `   µ  ÷     x     ã     w   k  E   ã  @   )  u   j  õ   à  Ó   Ö  k   ª  A     ~   X  à   ×    ¸    B  i   à   6  J!     "  K   "  |  é"     f$  s   $  C   ö$  )  :%  -   d&  W   &  B   ê&  {   -'  ?   ©'  ]   é'  ¤   G(  ¶  ì(     £*    A+     G,  @   f,  '   §,  $   Ï,  <   ô,     1-     ?-  0   P-  7  -  Z   ¹.     /     "/     0/  ®   I/  0   ø/  '   )0     Q0  Ï   æ0  9   ¶1     ð1  Z  2  Û   ç3  <   Ã4  f    5  /  g5  ¶   6  N   N7  <   7     Ú7  J  `8  c   «9  .  :  ¸   >;  \   ÷;  ^   T<  ©   ³<  A  ]=     >     @@  R   Ô@  ¹   'A    áA   :app:`Pyramid` supports any persistent storage mechanism (e.g., object database or filesystem files). It also supports an additional mechanism to map URLs to code (:term:`traversal`). However, for the purposes of this tutorial, we'll only be using :term:`URL dispatch` and :term:`SQLAlchemy`. A Python interpreter is installed on your operating system. After you've installed the project in development mode as well as the testing requirements, you may run the tests for the project. The following commands provide options to py.test that specify the module for which its tests shall be run, and to run py.test in quiet mode. Before you begin Change directory into your newly created project Cookiecutters include configuration defaults for ``py.test`` and test coverage. These configuration files are ``pytest.ini`` and ``.coveragerc``, located at the root of your package. Without these defaults, we would need to specify the path to the module on which we want to run tests and coverage. Create a virtual environment Creating a project using the ``alchemy`` cookiecutter makes the following assumptions: Decisions the ``alchemy`` cookiecutter has made for you Each version of Python uses different paths, so you will need to adjust the path to the command for your Python version. Recent versions of the Python 3 installer for Windows now install a Python launcher. Expose test coverage information For a successful test run, you should see output that ends like this: Generate a Pyramid project from a cookiecutter If prompted for the first item, accept the default ``yes`` by hitting return. If successful, you will see output something like this: If successful, you will see something like this on your console: If you need to install the SQLite3 packages, then, for example, using the Debian system and ``apt-get``, the command would be the following: If you used a package manager to install your Python or if you compiled your Python from source, then you must install SQLite3 and its development packages.  If you downloaded your Python as an installer from https://www.python.org, then you already have it installed and can skip this step. In a browser, visit http://localhost:6543/. You will see the generated application's default page. In order to do development on the project easily, you must "register" the project as a development egg in your workspace. We will install testing requirements at the same time. We do so with the following command. Initializing the database Install SQLite3 and its development packages Install cookiecutter Installation Installing the project in development mode On UNIX On Windows On all operating systems One thing you'll notice is the "debug toolbar" icon on right hand side of the page.  You can read more about the purpose of the icon at :ref:`debug_toolbar`.  It allows you to get information about your application while you develop. Our package doesn't quite have 100% test coverage. Python 2.7: Python 3.6: Run the tests See py.test's documentation for :ref:`pytest:usage` or invoke ``py.test -h`` to see its full set of options. Set and use a ``VENV`` environment variable Start the application Start the application. See :ref:`what_is_this_pserve_thing` for more information on ``pserve``. Success!  You should now have a ``tutorial.sqlite`` file in your current working directory. This is an SQLite database with a single table defined in it (``models``). Test and coverage cookiecutter defaults Testing requirements are defined in our project's ``setup.py`` file, in the ``tests_require`` and ``extras_require`` stanzas. The ``initialize_tutorial_db`` command does not perform a migration, but rather it simply creates missing tables and adds some dummy data. If you already have a database, you should delete it before running ``initialize_tutorial_db`` again. The console will show ``pip`` checking for packages and installing missing packages. Success executing this command will show a line like the following: The output to your console should be something like this: This means the server is ready to accept requests. This tutorial assumes that you have already followed the steps in :ref:`installing_chapter`, except **do not create a virtual environment or install Pyramid**.  Thereby you will satisfy the following requirements. Type the following command, making sure you are still in the ``tutorial`` directory (the directory with a ``development.ini`` in it): Upgrade packaging tools in the virtual environment Visit the application in a browser We need to use the ``initialize_tutorial_db`` :term:`console script` to initialize our database. We will create a Pyramid project in your home directory for UNIX or at the root for Windows. It is assumed you know the path to where you installed ``cookiecutter``. Issue the following commands and override the defaults in the prompts as follows. We will set the ``VENV`` environment variable to the absolute path of the virtual environment, and use it going forward. We will use a :term:`cookiecutter` to create a Python package project from a Python package project template.  See `Cookiecutter Installation <https://cookiecutter.readthedocs.io/en/latest/installation.html>`_ for instructions. We've already installed the ``pytest-cov`` package into our virtual environment, so we can run the tests with coverage. You are willing to use :term:`SQLAlchemy` for a database access tool. You are willing to use :term:`URL dispatch` to map URLs to code. You are willing to use SQLite for persistent storage, although almost any SQL database could be used with SQLAlchemy. You can run the ``py.test`` command to see test coverage information. This runs the tests in the same way that ``py.test`` does, but provides additional :term:`coverage` information, exposing which lines of your project are covered by the tests. You want to use pyramid_jinja2_ to render your templates. Different templating engines can be used, but we had to choose one to make this tutorial. See :ref:`available_template_system_bindings` for some options. You want to use zope.sqlalchemy_, pyramid_tm_, and the transaction_ packages to scope sessions to requests. You've satisfied the :ref:`requirements-for-installing-packages`. Your OS firewall, if any, may pop up a dialog asking for authorization to allow python to accept incoming network connections. py.test follows :ref:`conventions for Python test discovery <pytest:test discovery>`, and the configuration defaults from the cookiecutter tell ``py.test`` where to find the module on which we want to run tests and coverage. Project-Id-Version: The Pyramid Web Framework 1.9.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-08-02 00:00+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 ï¼appï¼ `Pyramid`ã¯æ°¸ç¶ã¹ãã¬ã¼ã¸æ©æ§ï¼ãªãã¸ã§ã¯ããã¼ã¿ãã¼ã¹ããã¡ã¤ã«ã·ã¹ãã ãã¡ã¤ã«ãªã©ï¼ããµãã¼ããã¾ããã¾ããURLãã³ã¼ãï¼ï¼termï¼ `traversal`ï¼ã«ãããããè¿½å ã®ã¡ã«ããºã ããµãã¼ããã¦ãã¾ãããã ãããã®ãã¥ã¼ããªã¢ã«ã§ã¯ãtermï¼ `URL dispatch`ã¨ï¼termï¼` SQLAlchemy`ã®ã¿ãä½¿ç¨ãã¾ãã Pythonã¤ã³ã¿ããªã¿ããªãã¬ã¼ãã£ã³ã°ã·ã¹ãã ã«ã¤ã³ã¹ãã¼ã«ããã¦ãã¾ãã ãã­ã¸ã§ã¯ããéçºã¢ã¼ãããã³ãã¹ãè¦ä»¶ã«ã¤ã³ã¹ãã¼ã«ãããããã­ã¸ã§ã¯ãã®ãã¹ããå®è¡ã§ãã¾ããæ¬¡ã®ã³ãã³ãã¯ããã¹ããå®è¡ããã¢ã¸ã¥ã¼ã«ãæå®ããpy.testã«ãªãã·ã§ã³ãæä¾ããquietã¢ã¼ãã§py.testãå®è¡ãã¾ãã ããªããå§ããåã« æ°ããä½æãããã­ã¸ã§ã¯ãã«ãã£ã¬ã¯ããªãå¤æ´ãã Cookiecuttersã«ã¯ã `` py.test``ã¨ãã¹ãã«ãã¬ãã¸ã®ããã©ã«ãè¨­å®ãå«ã¾ãã¦ãã¾ãããããã®è¨­å®ãã¡ã¤ã«ã¯ããã±ã¼ã¸ã®ã«ã¼ãã«ãã `` pytest.ini``ã¨ `` .coveragerc``ã§ãããããã®ããã©ã«ãããªããã°ããã¹ãã¨ã«ãã¬ãã¸ãå®è¡ããã¢ã¸ã¥ã¼ã«ã¸ã®ãã¹ãæå®ããå¿è¦ãããã¾ãã ä»®æ³ç°å¢ãä½æãã `` alchemy`` cookiecutterãä½¿ã£ã¦ãã­ã¸ã§ã¯ããä½æããã¨ãä»¥ä¸ã®åæãæãç«ã¡ã¾ãï¼ ``é¬éè¡å¸« `` cookcutterãããªãã®ããã«ä½ã£ãæ±ºå® Pythonã®åãã¼ã¸ã§ã³ã¯ç°ãªããã¹ãä½¿ç¨ãããããPythonãã¼ã¸ã§ã³ã®ã³ãã³ãã¸ã®ãã¹ãèª¿æ´ããå¿è¦ãããã¾ããæè¿ã®ãã¼ã¸ã§ã³ã®Windowsç¨Python 3ã¤ã³ã¹ãã¼ã©ã¯ãPythonã©ã³ãã£ãã¤ã³ã¹ãã¼ã«ããããã«ãªãã¾ããã ãã¹ãã«ãã¬ãã¸æå ±ãå¬éãã ãã¹ããæ­£å¸¸ã«çµäºããã«ã¯ãæ¬¡ã®ãããªåºåãè¡¨ç¤ºããã¾ãã cookiecutterãããã©ããããã­ã¸ã§ã¯ããçæãã æåã®é ç®ã®å¥åãæ±ããããããreturnã­ã¼ãæ¼ãã¦ããã©ã«ãã® `` yes``ãåãå¥ãã¾ãã æåããã¨ãæ¬¡ã®ãããªåºåãè¡¨ç¤ºããã¾ãã æåããå ´åãã³ã³ã½ã¼ã«ã«æ¬¡ã®ãããªã¡ãã»ã¼ã¸ãè¡¨ç¤ºããã¾ãã SQLite3ããã±ã¼ã¸ãã¤ã³ã¹ãã¼ã«ããå¿è¦ãããå ´åï¼Debianã·ã¹ãã ã¨ `` apt-get``ãªã©ï¼ãã³ãã³ãã¯æ¬¡ã®ããã«ãªãã¾ãï¼ ããã±ã¼ã¸ããã¼ã¸ã£ãä½¿ç¨ãã¦Pythonãã¤ã³ã¹ãã¼ã«ããå ´åãã¾ãã¯ã½ã¼ã¹ããPythonãã³ã³ãã¤ã«ããå ´åã¯ãSQLite3ã¨ãã®éçºããã±ã¼ã¸ãã¤ã³ã¹ãã¼ã«ããå¿è¦ãããã¾ãã Pythonãhttps://www.python.orgããã¤ã³ã¹ãã¼ã©ã¨ãã¦ãã¦ã³ã­ã¼ãããå ´åã¯ããã§ã«ã¤ã³ã¹ãã¼ã«æ¸ã¿ã§ããããã®æé ãçç¥ãããã¨ãã§ãã¾ãã ãã©ã¦ã¶ã§httpï¼// localhostï¼6543 /ããè¦§ãã ãããçæãããã¢ããªã±ã¼ã·ã§ã³ã®ããã©ã«ããã¼ã¸ãè¡¨ç¤ºããã¾ãã ãã­ã¸ã§ã¯ãã®éçºãå®¹æã«ããããã«ã¯ããã­ã¸ã§ã¯ããã¯ã¼ã¯ã¹ãã¼ã¹ã®éçºåµã¨ãã¦ç»é²ããå¿è¦ãããã¾ããåæã«ãã¹ãè¦ä»¶ãã¤ã³ã¹ãã¼ã«ãã¾ããæ¬¡ã®ã³ãã³ãã§ãããè¡ãã¾ãã ãã¼ã¿ãã¼ã¹ã®åæå SQLite3ã¨ãã®éçºããã±ã¼ã¸ãã¤ã³ã¹ãã¼ã«ãã cookiecutterãã¤ã³ã¹ãã¼ã«ãã ï¼æ©æ¢°ç¿»è¨³ï¼ã¤ã³ã¹ãã¼ã« éçºã¢ã¼ãã§ã®ãã­ã¸ã§ã¯ãã®ã¤ã³ã¹ãã¼ã« UNIXã®å ´å Windowsã®å ´å ãã¹ã¦ã®ãªãã¬ã¼ãã£ã³ã°ã·ã¹ãã  ããªããæ°ã¥ããã¨ã®1ã¤ã¯ããã¼ã¸ã®å³å´ã®\ &quot;ãããã°ãã¼ã«ãã¼\&quot;ã¢ã¤ã³ã³ã§ããã¢ã¤ã³ã³ã®ç®çã«ã¤ãã¦è©³ããã¯ãrefï¼ `debug_toolbar`ãåç§ãã¦ãã ãããéçºä¸­ã«ã¢ããªã±ã¼ã·ã§ã³ã«é¢ããæå ±ãå¾ããã¨ãã§ãã¾ãã ç§ãã¡ã®ããã±ã¼ã¸ã¯100ï¼ã®ãã¹ãã«ãã¬ãã¸ãæã£ã¦ãã¾ããã Python 2.7ï¼ Python 3.6ï¼ ãã¹ããå®è¡ãã ï¼refï¼ `pytestï¼usage`ã®py.testã®ãã­ã¥ã¡ã³ããåç§ãããã` `py.test -h``ãå¼ã³åºãã¦ãã®å®å¨ãªãªãã·ã§ã³ã»ãããè¦ã¦ãã ããã `` VENV``ç°å¢å¤æ°ãè¨­å®ãã¦ä½¿ç¨ãã ã¢ããªã±ã¼ã·ã§ã³ãèµ·åãã ã¢ããªã±ã¼ã·ã§ã³ãèµ·åãã¾ãã `` pserve``ã®è©³ç´°ã«ã¤ãã¦ã¯ï¼refï¼ `what_is_this_pserve_thing`ãåç§ãã¦ãã ããã æåï¼ç¾å¨ã®ä½æ¥­ãã£ã¬ã¯ããªã« `` tutorial.sqlite``ãã¡ã¤ã«ãããã¯ãã§ããããã¯ãåä¸ã®ãã¼ãã«ãå®ç¾©ãããSQLiteãã¼ã¿ãã¼ã¹ã§ãï¼ ``ã¢ãã« ``ï¼ã ãã¹ãã¨ã«ãã¬ãã¸cookiecutterã®ããã©ã«ã ãã¹ãè¦ä»¶ã¯ããã­ã¸ã§ã¯ãã® `` setup.py``ãã¡ã¤ã«ã `` tests_require``ã¨ `` extras_require``ã¹ã¿ã³ã¶ã§å®ç¾©ããã¦ãã¾ãã `` initialize_tutorial_db``ã³ãã³ãã¯ãç§»è¡ãå®è¡ãã¾ããããæ¬ è½ãã¦ãããã¼ãã«ãä½æããããã¤ãã®ããã¼ãã¼ã¿ãè¿½å ããã ãã§ãããã§ã«ãã¼ã¿ãã¼ã¹ãããå ´åã¯ã `` initialize_tutorial_db``ãååº¦å®è¡ããåã«ãã¼ã¿ãã¼ã¹ãåé¤ããå¿è¦ãããã¾ãã ã³ã³ã½ã¼ã«ã¯ `` pip``ã§ããã±ã¼ã¸ã®ãã§ãã¯ã¨æ¬ è½ãã¦ããããã±ã¼ã¸ã®ã¤ã³ã¹ãã¼ã«ãè¡¨ç¤ºãã¾ãããã®ã³ãã³ããå®è¡ããã¨ãæ¬¡ã®ãããªè¡ãè¡¨ç¤ºããã¾ãã ã³ã³ã½ã¼ã«ã¸ã®åºåã¯æ¬¡ã®ããã«ãªãã¾ãã ããã¯ããµã¼ãã¼ãè¦æ±ãåãå¥ããæºåãã§ãã¦ãããã¨ãæå³ãã¾ãã ãã®ãã¥ã¼ããªã¢ã«ã§ã¯ã** refï¼ `installing_chapter`ã®æé ã«å¾ã£ã¦ãããã¨ãåæã¨ãã¦ãã¾ããã**ä»®æ³ç°å¢ãä½æããããPyramid **ãã¤ã³ã¹ãã¼ã«ããããããã¨ã¯ããã¾ãããããã«ãããããªãã¯æ¬¡ã®è¦ä»¶ãæºããã¾ãã æ¬¡ã®ã³ãã³ããå¥åãã¦ã `` tutorial``ãã£ã¬ã¯ããªï¼ `` development.ini``ããããã£ã¬ã¯ããªï¼ã«ã¾ã å¥ã£ã¦ãããã¨ãç¢ºèªãã¦ãã ããï¼ ä»®æ³ç°å¢ã«ãããããã±ã¼ã¸ã³ã°ãã¼ã«ã®ã¢ããã°ã¬ã¼ã ãã©ã¦ã¶ã§ã¢ããªã±ã¼ã·ã§ã³ã«ã¢ã¯ã»ã¹ãã ãã¼ã¿ãã¼ã¹ãåæåããã«ã¯ã `` initialize_tutorial_db``ï¼termï¼ `console script`ãä½¿ãå¿è¦ãããã¾ãã UNIXã®å ´åã¯ãã¼ã ãã£ã¬ã¯ããªã«ãWindowsã®å ´åã¯ã«ã¼ãã«Pyramidãã­ã¸ã§ã¯ããä½æãã¾ãã `` cookiecutter``ãã¤ã³ã¹ãã¼ã«ããå ´æã¸ã®ãã¹ãç¥ã£ã¦ããã¨ä»®å®ãã¾ããæ¬¡ã®ã³ãã³ããçºè¡ãããã­ã³ããã®ããã©ã«ããæ¬¡ã®ããã«å¤æ´ãã¾ãã `` VENV``ç°å¢å¤æ°ãä»®æ³ç°å¢ã®çµ¶å¯¾ãã¹ã«è¨­å®ãããããåã«ä½¿ç¨ãã¾ãã ï¼termï¼ `cookiecutter`ãä½¿ã£ã¦ãPythonããã±ã¼ã¸ãã­ã¸ã§ã¯ããã³ãã¬ã¼ãããPythonããã±ã¼ã¸ãã­ã¸ã§ã¯ããä½æãã¾ãã `Cookiecutterã®ã¤ã³ã¹ãã¼ã«<https://cookiecutter.readthedocs.io/en/latest/installation.html> `_ã®æç¤ºã«å¾ã£ã¦ãã ããã ç§ãã¡ã¯æ¢ã« `` pytest-cov``ããã±ã¼ã¸ãä»®æ³ç°å¢ã«ã¤ã³ã¹ãã¼ã«ãã¦ãã¾ãã®ã§ãã«ãã¬ãã¸ãæã£ã¦ãã¹ããå®è¡ãããã¨ãã§ãã¾ãã ãã¼ã¿ãã¼ã¹ã¢ã¯ã»ã¹ãã¼ã«ã®å ´åãtermï¼ `SQLAlchemy`ãä½¿ç¨ãã¾ãã ããªãã¯URLãã³ã¼ãã«ãããããããã«termï¼ `URL dispatch`ãä½¿ãã¾ãã ã»ã¼ãã¹ã¦ã®SQLãã¼ã¿ãã¼ã¹ãSQLAlchemyã§ä½¿ç¨ãããã¨ãã§ãã¾ãããæ°¸ç¶ã¹ãã¬ã¼ã¸ã¨ãã¦SQLiteãä½¿ç¨ããææãããã¾ãã `` py.test``ã³ãã³ããå®è¡ããã¨ãã¹ãã«ãã¬ãã¸æå ±ãè¦ããã¨ãã§ãã¾ããããã¯ã `` py.test``ã¨åãããã«ãã¹ããå®è¡ãã¾ãããtermï¼ `ã«ãã¬ãã¸ï¼coverageï¼ &#39;æå ±ãè¿½å ãã¦ããã¹ãã®å¯¾è±¡ã¨ãªããã­ã¸ã§ã¯ãã®è¡ãå¬éãã¾ãã ããªãã¯ãã³ãã¬ã¼ããã¬ã³ããªã³ã°ããããã«pyramid_jinja2_ãä½¿ãããã¨æã£ã¦ãã¾ããç°ãªããã³ãã¬ã¼ãã¨ã³ã¸ã³ãä½¿ç¨ãããã¨ãã§ãã¾ããããã®ãã¥ã¼ããªã¢ã«ãä½æããã«ã¯1ã¤ãé¸æããå¿è¦ãããã¾ãããããã¤ãã®ãªãã·ã§ã³ã«ã¤ãã¦ã¯ï¼refï¼ `available_template_system_bindings`ãåç§ãã¦ãã ããã zope.sqlalchemy_ãpyramid_tm_ãããã³transaction_ããã±ã¼ã¸ãä½¿ç¨ãã¦ãè¦æ±ã«å¯¾ããã»ãã·ã§ã³ãã¹ã³ã¼ããã¾ãã ããªãã¯ï¼refï¼ `require-for-installing-packages`ãæºè¶³ãã¦ãã¾ãã ããªãã®OSã®ãã¡ã¤ã¢ã¦ã©ã¼ã«ãããã°ãPythonãçä¿¡ãããã¯ã¼ã¯æ¥ç¶ãåãå¥ãããã¨ãè¨±å¯ãããã¤ã¢ã­ã°ããã¯ã¹ãè¡¨ç¤ºããã¾ãã py.testã¯æ¬¡ã®ããã«ãªãã¾ãï¼refï¼ `Pythonãã¹ãã®çºè¦ã®ããã®è¦å<pytest:test discovery> `ã§ãããcookiecutterã®ããã©ã«ãè¨­å®ã¯` `py.test``ã«ãã¹ãã¨ã«ãã¬ãã¸ãå®è¡ããã¢ã¸ã¥ã¼ã«ãè¦ã¤ããå ´æãæå®ãã¾ãã 