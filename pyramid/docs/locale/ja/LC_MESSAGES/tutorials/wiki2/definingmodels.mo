Þ    ,      |              Ü     Ý     í    ý        ¬  J   ½	  J   
  /   S
     
     
      ¹
  N   Ú
  7   )  {   a     Ý     p     y  ,     .   ²  Q   á  B   3  U   v     Ì     â  Æ   ÿ     Æ  r  [  `   Î  &   /     V     ò     r    s  ®    I   ?  6     !   À    â  U  ô  »   J  ü     $    Þ   (      (     ;   º  ³  ö    ª#  a  ;'  M   (  M   ë(  k   9)  9   ¥)  H   ß)  T   (*  i   }*     ç*     p+  Æ   ÿ+     Æ,     ×,  E   ë,  É   1-  _   û-  P   [.  c   ¬.  6   /  M   G/  þ   /  Ç   0  Ì  \1  c   )3  -   3  ×   »3     4    #5  ¨  µ6  T  ^9  U   ³;  Z   	<  Y   d<    ¾<  ·  R>  Ì   
@     ×@    øA    {C   Add ``page.py`` Add ``user.py`` As you can see, our ``Page`` class is very similar to the ``User`` defined above, except with attributes focused on storing information about a wiki page, including ``id``, ``name``, and ``data``. The only new construct introduced here is the ``creator_id`` column, which is a foreign key referencing the ``users`` table. Foreign keys are very useful at the schema-level, but since we want to relate ``User`` objects with ``Page`` objects, we also define a ``creator`` attribute as an ORM-level mapping between the two tables. SQLAlchemy will automatically populate this value using the foreign key referencing the user. Since the foreign key has ``nullable=False``, we are guaranteed that an instance of ``page`` will have a corresponding ``page.creator``, which will be a ``User`` instance. As you can see, our ``User`` class has a class-level attribute ``__tablename__`` which equals the string ``users``. Our ``User`` class will also have class-level attributes named ``id``, ``name``, ``password_hash``, and ``role`` (all instances of :class:`sqlalchemy.schema.Column`). These will map to columns in the ``users`` table. The ``id`` attribute will be the primary key in the table. The ``name`` attribute will be a text column, each value of which needs to be unique within the column. The ``password_hash`` is a nullable text attribute that will contain a securely hashed password. Finally, the ``role`` text attribute will hold the role of the user. Because our model has changed, and in order to reinitialize the database, we need to rerun the ``initialize_tutorial_db`` command to pick up the changes we've made to both the models.py file and to the initializedb.py file. See :ref:`initialize_db_wiki2` for instructions. Create a new file ``tutorial/models/page.py`` with the following contents: Create a new file ``tutorial/models/user.py`` with the following contents: Declaring dependencies in our ``setup.py`` file Defining the Domain Model Edit ``models/__init__.py`` Edit ``scripts/initializedb.py`` Here we align our imports with the names of the models, ``Page`` and ``User``. Installing the project and re-initializing the database Let's delete the file ``tutorial/models/mymodel.py``. The ``MyModel`` class is only a sample and we're not going to use it. Make sure your current working directory is the root of the project (the directory in which ``setup.py`` lives) and execute the following command. On UNIX: On Windows: Only the highlighted line needs to be added. Only the highlighted lines need to be changed. Open ``tutorial/scripts/initializedb.py`` and edit it to look like the following: Open ``tutorial/setup.py`` and edit it to look like the following: Open the ``tutorial/models/__init__.py`` file and edit it to look like the following: Remove ``mymodel.py`` Running ``pip install -e .`` Since a new software dependency was added, you will need to run ``pip install -e .`` again inside the root of the ``tutorial`` package to obtain and register the newly added dependency distribution. Since we are using a package for our models, we also need to update our ``__init__.py`` file to ensure that the models are attached to the metadata. Since we've changed our model, we need to make changes to our ``initializedb.py`` script.  In particular, we'll replace our import of ``MyModel`` with those of ``User`` and ``Page``. We'll also change the very end of the script to create two ``User`` objects (``basic`` and ``editor``) as well as a ``Page``, rather than a ``MyModel``, and add them to our ``dbsession``. Success executing this command will end with a line to the console something like the following. Success will look something like this: The command is named ``initialize_tutorial_db`` because of the mapping defined in the ``[console_scripts]`` entry point of our project's ``setup.py`` file. The first change we'll make to our stock cookiecutter-generated application will be to define a wiki page :term:`domain model`. The models code in our application will depend on a package which is not a dependency of the original "tutorial" application.  The original "tutorial" application was generated by the cookiecutter; it doesn't know about our custom application requirements. There are two helper methods that will help us later when using the user objects. The first is ``set_password`` which will take a raw password and transform it using ``bcrypt`` into an irreversible representation, a process known as "hashing". The second method, ``check_password``, will allow us to compare the hashed value of the submitted password against the hashed value of the password stored in the user's record in the database. If the two hashed values match, then the submitted password is valid, and we can authenticate the user. There is nothing special about the filename ``user.py`` or ``page.py`` except that they are Python modules.  A project may have many models throughout its codebase in arbitrarily named modules.  Modules implementing models often have ``model`` in their names or they may live in a Python subpackage of your application package named ``models`` (as we've done in this tutorial), but this is only a convention and not a requirement. This is a very basic model for a user who can authenticate with our wiki. This will also happen if you attempt to run the tests. View the application in a browser We are using the ``bcrypt`` package from PyPI to hash our passwords securely. There are other one-way hash algorithms for passwords if ``bcrypt`` is an issue on your system. Just make sure that it's an algorithm approved for storing passwords versus a generic one-way hash. We can't.  At this point, our system is in a "non-runnable" state; we'll need to change view-related files in the next chapter to be able to start the application successfully.  If you try to start the application (see :ref:`wiki2-start-the-application`), you'll wind up with a Python traceback on your console that ends with this exception: We discussed briefly in the previous chapter that our models will inherit from an SQLAlchemy :func:`sqlalchemy.ext.declarative.declarative_base`. This will attach the model to our schema. We hash passwords so that it is impossible to decrypt them and use them to authenticate in the application. If we stored passwords foolishly in clear text, then anyone with access to the database could retrieve any password to authenticate as any user. We haven't looked at the details of this file yet, but within the ``scripts`` directory of your ``tutorial`` package is a file named ``initializedb.py``. Code in this file is executed whenever we run the ``initialize_tutorial_db`` command, as we did in the installation step of this tutorial. We need to add a dependency, the `bcrypt <https://pypi.org/project/bcrypt/>`_ package, to our ``tutorial`` package's ``setup.py`` file by assigning this dependency to the ``requires`` parameter in the ``setup()`` function. Project-Id-Version: The Pyramid Web Framework 1.9.2
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
 ãpage.pyããè¿½å ãã¦ãã ãã ãuser.pyããè¿½å ãã¦ãã ãã( Add ``user.py`` ) è¦ã¦åããããã«ããPageãã¯ã©ã¹ã¯ã ãidãã ãnameãããdataãã¨wikiãã¼ã¸ã«é¢ããæå ±ãæ ¼ç´ãããã¨ã«ç¦ç¹ãå½ã¦ãå±æ§ãé¤ãã°ãä¸ã§å®ç¾©ãããUserãã¨ããä¼¼ã¦ãã¾ãã ããã§ç´¹ä»ããå¯ä¸ã®æ°ãããã®ã¯ãcreator_idãã«ã©ã ã§ãããã¯ãusersããã¼ãã«ãåç§ããå¤é¨ã­ã¼ã§ããå¤é¨ã­ã¼ã¯ã¹ã­ã¼ãã¬ãã«ã§éå¸¸ã«ä¾¿å©ã§ããã ãUserããªãã¸ã§ã¯ãã¨ãPageããªãã¸ã§ã¯ããé¢é£ä»ããããã ãcreatorãå±æ§ã2ã¤ã®ORMã¬ãã«ã®ãããã³ã°ã¨ãã¦å®ç¾©ãã¾ããSQLAlchemyã¯Userãåç§ããå¤é¨ã­ã¼ãä½¿ç¨ãã¦ãã®å¤ãèªåçã«è¨­å®ãã¾ããå¤é¨ã­ã¼ã«ã¯ ãnullable = Falseããããã®ã§ã ãpageãã®ã¤ã³ã¹ã¿ã³ã¹ã«å¯¾å¿ãããpage.creatorãããããã¨ãä¿è¨¼ããã¾ããããã¯ãUserãã¤ã³ã¹ã¿ã³ã¹ã«ãªãã¾ãã ãè¦§ã®ããã«ãUserãã¯ã©ã¹ã«ã¯ã¯ã©ã¹ã¬ãã«ã®ã__tablename__ãã¢ããªãã¥ã¼ããããã¾ãããã®ã¢ããªãã¥ã¼ãã¯æå­å ãusersãã«ç¸å½ãã¾ãããUserãã¯ã©ã¹ã«ã¯ ãidãã ãnameãã ãpassword_hashãã ãroleãã¨ããã¯ã©ã¹ã¬ãã«ã®ã¢ããªãã¥ã¼ããããã¾ãï¼ãã¹ã¦ã®ã¤ã³ã¹ã¿ã³ã¹ã® :class:`sqlalchemy.schema.Column` ï¼ããããã¯ãusersããã¼ãã«ã®åã«ãããããã¾ãã ãidãã¢ããªãã¥ã¼ãããã¼ãã«ã®ä¸»ã­ã¼ã«ãªãã¾ãããnameãã¢ããªãã¥ã¼ãã¯ãã­ã¹ãåã«ãªããåå¤ã¯ååã§ä¸æã§ããå¿è¦ãããã¾ãã ãpassword_hashãã¯ãå®å¨ã«ããã·ã¥ããããã¹ã¯ã¼ããå«ãnullãå«ããã­ã¹ãã¢ããªãã¥ã¼ãã§ããæå¾ã«ãroleãã®ãã­ã¹ãã¢ããªãã¥ã¼ããã¦ã¼ã¶ã®å½¹å²ãæãã¾ãã ç§ãã¡ã®ã¢ãã«ã¯å¤æ´ããã¦ããããã¼ã¿ãã¼ã¹ãååæåããããã«ã¯ããinitialize_tutorial_dbãã³ãã³ããåå®è¡ãã¦ãmodels.pyãã¡ã¤ã«ã¨initializedb.pyãã¡ã¤ã«ã®ä¸¡æ¹ã®å¤æ´ãåãä¸ããå¿è¦ãããã¾ããåå®¹ã«ã¤ãã¦ã¯ :ref:`initialize_db_wiki2` ãåç§ãã¦ãã ããã ãtutorial/models/page.pyããã¡ã¤ã«ãæ¬¡ã®åå®¹ã§ä½æãã¾ãï¼ ãtutorial/models/user.pyããã¡ã¤ã«ãæ¬¡ã®åå®¹ã§ä½æãã¾ãï¼ `` setup.py``ãã¡ã¤ã«ã®ä¾å­é¢ä¿ãå®£è¨ãã¾ã(Declaring dependencies in our ``setup.py`` file) ãã¡ã¤ã³ã¢ãã«ã®å®ç¾©(Defining the Domain Model) ãmodels/__init__.pyããç·¨éãããEdit ``models/__init__.py``ã ãscripts/initializedb.pyããç·¨éããï¼ Edit ``scripts/initializedb.py`` ï¼ ããã§ã¯ãã¤ã³ãã¼ãã¨ã¢ãã«ã®ååã ãPageãã¨ãUserããåããã¦ãã¾ãã ãã­ã¸ã§ã¯ãã®ã¤ã³ã¹ãã¼ã«ã¨ãã¼ã¿ãã¼ã¹ã®ååæåï¼Installing the project and re-initializing the databaseï¼ ãtutorial/models/mymodel.pyããã¡ã¤ã«ãåé¤ãã¾ãããã ãMyModelãã¯ã©ã¹ã¯åãªããµã³ãã«ã§ä½¿ç¨ãã¾ããã ç¾å¨ã®ä½æ¥­ãã£ã¬ã¯ããªããã­ã¸ã§ã¯ãã®ã«ã¼ãï¼ ãsetup.pyããå­å¨ãããã£ã¬ã¯ããªï¼ã§ãããã¨ãç¢ºèªããæ¬¡ã®ã³ãã³ããå®è¡ãã¦ãã ããã UNIXã®å ´åï¼ Windowsã®å ´åï¼ å¼·èª¿è¡¨ç¤ºãããè¡ã ããè¿½å ããå¿è¦ãããã¾ãã ãã¤ã©ã¤ãè¡¨ç¤ºããã¦ããè¡ã ããå¤æ´ããå¿è¦ãããã¾ããâ»ç¿»è¨³ã®æ³¨æãææ°çã§ã¯ãã®æ¬¡ã«Alembicãä½¿ç¨ããDBã®ãã¤ã°ã¬ã¼ã·ã§ã³ã®é ç®ããã ãtutorial/scripts/initializedb.pyããéããä»¥ä¸ã®ããã«ç·¨éãã¦ãã ããï¼ ãtutorial/setup.pyããéããä»¥ä¸ã®ããã«ç·¨éãã¦ãã ããï¼ ãtutorial/models/__init__.pyããã¡ã¤ã«ãéãä»¥ä¸ã®ããã«ç·¨éãã¦ãã ããï¼ `` mymodel.py`ãåé¤ãã( Remove ``mymodel.py`` ) ãpip install -e .ããå®è¡ããã¾ãã(Running ``pip install -e .`` ) æ°ããã½ããã¦ã§ã¢ã®ä¾å­é¢ä¿ãè¿½å ãããã®ã§ã ãtutorialãããã±ã¼ã¸ã®ã«ã¼ãã®ä¸­ã§ ãpip install -e .ããååº¦å®è¡ãã¦ãæ°ãã«è¿½å ãããä¾å­é¢ä¿ãåå¾ãã¦ç»é²ããå¿è¦ãããã¾ãã ã¢ãã«ã«ããã±ã¼ã¸ãä½¿ç¨ãã¦ããã®ã§ã ã__init __.pyããã¡ã¤ã«ãæ´æ°ãã¦ã¢ãã«ãã¡ã¿ãã¼ã¿ã«æ·»ä»ããã¦ãããã¨ãç¢ºèªããå¿è¦ãããã¾ãã ã¢ãã«ãå¤æ´ããã®ã§ããinitializedb.pyãã¹ã¯ãªãããå¤æ´ããå¿è¦ãããã¾ããå·ä½çã«ã¯ãMyModelã®ã¤ã³ãã¼ãããUserãã¨ãPageãã®ãã®ã«ç½®ãæãã¾ããã¾ããã¹ã¯ãªããã®æå¾ããMyModeãã§ã¯ãªããUserããªãã¸ã§ã¯ãï¼ãbasicãã¨ãeditorãï¼ã¨ãPageããä½æããããã«å¤æ´ãã¾ãããdbsessionãã«è¿½å ããããã«ã¹ã¯ãªãããå¤æ´ãã¾ãã ãã®ã³ãã³ããå®è¡ããã¨ãæ¬¡ã®ãããªè¡ãã³ã³ã½ã¼ã«ã«è¡¨ç¤ºããã¾ãã æåããã¨æ¬¡ã®ããã«ãªãã¾ãã ãã®ã³ãã³ãã¯ããã­ã¸ã§ã¯ãã® ãsetup.pyããã¡ã¤ã«ã® [console_scripts] ã¨ã³ããªãã¤ã³ãã§å®ç¾©ããããããã³ã°ã®ããããinitialize_tutorial_dbãã¨ããååã§ãã cookiecutterã§çæãããã¢ããªã±ã¼ã·ã§ã³ã®æåã®å¤æ´ã¯ãwikiãã¼ã¸ :term:`domain model` ãå®ç¾©ãããã¨ã§ãã ã¢ããªã±ã¼ã·ã§ã³ã®ã¢ãã«ã®ã³ã¼ãã¯ããªãªã¸ãã«ã® ããã¥ã¼ããªã¢ã«ãã¢ããªã±ã¼ã·ã§ã³ã®ä¾å­é¢ä¿ã§ã¯ãªãããã±ã¼ã¸ã«ä¾å­ãã¾ãããªãªã¸ãã«ã® ããã¥ã¼ããªã¢ã«ãã¢ããªã±ã¼ã·ã§ã³ã¯ãcookiecutterã«ãã£ã¦çæããã¾ããããããã«ã¹ã¿ã ã¢ããªã±ã¼ã·ã§ã³ã®è¦ä»¶ã«ã¤ãã¦ã¯ãããã¾ããã å¾ã§ã¦ã¼ã¶ã¼ãªãã¸ã§ã¯ããä½¿ç¨ããã¨ãã«å½¹ç«ã¤2ã¤ã®ãã«ãã¼ã¡ã½ãããããã¾ããæåã¯ãset_passwordãã§ããããã¯æªå¦çã®ãã¹ã¯ã¼ããã¨ãããbcryptããä½¿ã£ã¦éå¯éçãªè¡¨ç¾ã«å¤æãã¾ãããã®ãã­ã»ã¹ã¯ãhashingãã¨å¼ã°ãã¾ãã 2çªç®ã®ã¡ã½ãããcheck_passwordãã§ã¯ãéä¿¡ããããã¹ã¯ã¼ãã®ããã·ã¥å¤ã¨ããã¼ã¿ãã¼ã¹ã®ã¦ã¼ã¶ã¼ã¬ã³ã¼ãã«ä¿å­ããã¦ãããã¹ã¯ã¼ãã®ããã·ã¥å¤ãæ¯è¼ã§ãã¾ãã 2ã¤ã®ããã·ã¥å¤ãä¸è´ããã¨éä¿¡ããããã¹ã¯ã¼ããæå¹ãªã®ã§ã¦ã¼ã¶ã¼ãèªè¨¼ã§ãã¾ãã ãuser.pyããã¡ã¤ã«ããpage.pyããã¡ã¤ã«ã¯ãPythonã¢ã¸ã¥ã¼ã«ã§ãããã¨ãé¤ãã¦ç¹å¥ãªãã¨ã¯ä½ãããã¾ããããã­ã¸ã§ã¯ãã¯ã³ã¼ããã¼ã¹å¨ä½ã«ä»»æã®ååã®ã¢ã¸ã¥ã¼ã«ã§å¤ãã®ã¢ãã«ãæã¦ã¾ããã¢ãã«ãå®è£ããã¢ã¸ã¥ã¼ã«ã¯ããã°ãã°ååã«ãmodelããæã¤ãã ãmodelsãã¨ããååã®ã¢ããªã±ã¼ã·ã§ã³ããã±ã¼ã¸ã®Pythonãµãããã±ã¼ã¸ã«å¥ã£ã¦ãã¾ãï¼ãã®ãã¥ã¼ããªã¢ã«ã§è¡ã£ãããã«ï¼ãããããªããããã¯å¯å·ã§ããè¦ä»¶ã§ãã ããã¯wikiã§èªè¨¼ã¦ã¼ã¶ã¼ã®ããã®éå¸¸ã«åºæ¬çãªã¢ãã«ã§ãã å®è¡ä¸è½ãªç¾è±¡ã¯ãã¹ããå®è¡ãããã¨ããå ´åã«ãçºçãã¾ãã ãã©ã¦ã¶ã§ã¢ããªã±ã¼ã·ã§ã³ãè¡¨ç¤ºãã(View the application in a browser) PyPIã®ãbcryptãããã±ã¼ã¸ãä½¿ã£ã¦ãã¹ã¯ã¼ããå®å¨ã«ããã·ã¥ãã¦ãã¾ãããbcryptããã·ã¹ãã ä¸ã§åé¡ã§ããå ´åã¯ãã¹ã¯ã¼ãç¨ã®ä»ã®ä¸æ¹åããã·ã¥ã¢ã«ã´ãªãºã ãããã¾ããããã¯ãã¹ã¯ã¼ãã®ä¿å­ã«å¯¾ãã¦ä¸è¬çãªä¸æ¹åããã·ã¥ã«å¯¾ãã¦æ¿èªãããã¢ã«ã´ãªãºã ã§ãããã¨ãç¢ºèªãã¾ãã ã§ãã¾ããããã®æç¹ã§ãç§ãã¡ã®ã·ã¹ãã ã¯ãå®è¡ä¸å¯è½ããªç¶æã«ããã¾ããæ¬¡ã®ç« ã®ãã¥ã¼é¢é£ã®ãã¡ã¤ã«ãå¤æ´ãã¦ãã¢ããªã±ã¼ã·ã§ã³ãæ­£å¸¸ã«èµ·åã§ããããã«ãã¾ããã¢ããªã±ã¼ã·ã§ã³ãèµ·åãããã¨ããã¨ï¼ :ref:`wiki2-start-the-application` åç§ï¼ãã³ã³ã½ã¼ã«ã«ä¾å¤ã§çµãã Pythonã®ãã¬ã¼ã¹ããã¯ãè¡¨ç¤ºããã¾ãï¼ åã®ç« ã§ãç§ãã¡ã®ã¢ãã«ãSQLAlchemy :func:`sqlalchemy.ext.declarative.declarative_base` ããç¶æ¿ãããã¨ãç°¡åã«èª¬æãã¾ãããã¢ãã«ãã¹ã­ã¼ãã«æ·»ä»ãã¾ãã ããã·ã¥ããããã¹ã¯ã¼ããè§£èª­ãã¦ã¢ããªã±ã¼ã·ã§ã³ã§èªè¨¼ãããã¨ã¯ä¸å¯è½ã§ãããã¹ã¯ã¼ããæãã«ãå¹³æã§ä¿å­ããå ´åã¯ããã¼ã¿ãã¼ã¹ã«ã¢ã¯ã»ã¹ã§ããäººã¯èª°ã§ããã¹ã¯ã¼ããåå¾ãã¦èªè¨¼ã§ãã¾ãã ãã¡ã¤ã«ã®è©³ç´°ã¯ã¾ã è¦ã¦ãã¾ãããããã¥ã¼ããªã¢ã«ããã±ã¼ã¸ã®ãscriptsããã£ã¬ã¯ããªã«ãinitializedb.pyãã¨ããååã®ãã¡ã¤ã«ãããã¾ãããã®ãã¡ã¤ã«ã®ã³ã¼ãã¯ãã¥ã¼ããªã¢ã«ã®ã¤ã³ã¹ãã¼ã«æé ã§è¡ã£ãããã«ããinitialize_tutorial_dbãã³ãã³ããå®è¡ãããã³ã«å®è¡ããã¾ãã ä¾å­é¢ä¿ãè¿½å ããå¿è¦ãããã¾ãã  `bcrypt <https://pypi.org/project/bcrypt/>`_ ããã±ã¼ã¸ããtutorialãããã±ã¼ã¸ã®ãsetup.pyããã¡ã¤ã«ã«ããsetup()ãé¢æ°ã®ãrequiresããã©ã¡ã¼ã¿ã«ãã®ä¾å­é¢ä¿ãå²ãå½ã¦ã¾ãã 