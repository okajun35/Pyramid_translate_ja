Þ    )      d              ¬  >   ­  ²   ì       |   "  »     e   [  {   Á  I   =  	      	  r   ±  _  $  -     .   ²    á    {  H     Y  Z  <  ´  :  ñ  .   ,     [  Ë   h  $   4  %   Y  $     6   ¤  i  Û  H   E  ¶     '   E  Ê   m     8  S  À         §  Â   A   á   !     æ!  }  þ!    |#  [   %    _%  ±   m&  §   '    Ç'     á(     w)  p   
*  Ë  {*  Ñ  G.     1    ´1  P   J3  R   3    î3  Ï  ý5  u   Í7  ú  C8  Ô  >:  Ú  =  :   î>  #   )?  w  M?     Å@  5   ã@  4   A  T   NA  Ù  £A  u   }C    óC  2   E  ¨   ?E  Á   èE    ªF  Ò   @H  O  I    cL  é   eM     ON    oN   *Line 11*.  ``__init__.py`` defines a function named ``main``. *Line 14*.  Use an explicit transaction manager for apps so that they do not implicitly create new transactions when touching the manager outside of the ``pyramid_tm`` lifecycle. *Line 15*.  Construct a :term:`Configurator` as a :term:`context manager` with the settings keyword parsed by :term:`PasteDeploy`. *Line 16*.  Include support for the :term:`Chameleon` template rendering bindings, allowing us to use the ``.pt`` templates. *Line 17*.  Include support for ``pyramid_tm``, allowing Pyramid requests to join the active transaction as provided by the `transaction <https://pypi.org/project/transaction/>`_ package. *Line 18*.  Include support for ``pyramid_retry`` to retry a request when transient exceptions occur. *Line 19*.  Include support for ``pyramid_zodbconn``, providing integration between :term:`ZODB` and a Pyramid application. *Line 20*.  Set a root factory using our function named ``root_factory``. *Line 21*.  Register a "static view", which answers requests whose URL paths start with ``/static``, using the :meth:`pyramid.config.Configurator.add_static_view` method.  This statement registers a view that will serve up static assets, such as CSS and image files, for us, in this case, at ``http://localhost:6543/static/`` and below.  The first argument is the "name" ``static``, which indicates that the URL path prefix of the view will be ``/static``.  The second argument of this tag is the "path", which is a relative :term:`asset specification`, so it finds the resources it should serve within the ``static`` directory inside the ``tutorial`` package.  Alternatively the cookiecutter could have used an *absolute* asset specification as the path (``tutorial:static``). *Line 22*.  Perform a :term:`scan`.  A scan will find :term:`configuration decoration`, such as view configuration decorators (e.g., ``@view_config``) in the source code of the ``tutorial`` package and will take actions based on these decorators.  We don't pass any arguments to :meth:`~pyramid.config.Configurator.scan`, which implies that the scan should take place in the current package (in this case, ``tutorial``). The cookiecutter could have equivalently said ``config.scan('tutorial')``, but it chose to omit the package name argument. *Line 23*.  Use the :meth:`pyramid.config.Configurator.make_wsgi_app` method to return a :term:`WSGI` application. *Line 5*.  Use the :func:`pyramid.view.view_config` :term:`configuration decoration` to perform a :term:`view configuration` registration.  This view configuration registration will be activated when the application is started.  It will be activated by virtue of it being found as the result of a :term:`scan` (when Line 14 of ``__init__.py`` is run). *Lines 1-2*. Perform some dependency imports. *Lines 1-3*.  Perform some dependency imports. *Lines 4-5*.  The ``MyModel`` :term:`resource` class is implemented here. Instances of this class are capable of being persisted in :term:`ZODB` because the class inherits from the :class:`persistent.mapping.PersistentMapping` class.  The ``__parent__`` and ``__name__`` are important parts of the :term:`traversal` protocol. By default, set these to ``None`` to indicate that this is the :term:`root` object. *Lines 6-7*.  We define a :term:`view callable` named ``my_view``, which we decorated in the step above.  This view callable is a *function* we write generated by the ``zodb`` cookiecutter that is given a ``request`` and which returns a dictionary.  The ``mytemplate.pt`` :term:`renderer` named by the asset specification in the step above will convert this dictionary to a :term:`response` on our behalf. *Lines 6-8*.  Define a :term:`root factory` for our Pyramid application. *Lines 8-12*.  ``appmaker`` is used to return the *application root* object.  It is called on *every request* to the :app:`Pyramid` application.  It also performs bootstrapping by *creating* an application root (inside the ZODB root object) if one does not already exist.  It is used by the ``root_factory`` we've defined in our ``__init__.py``. :app:`Pyramid` uses the word :term:`resource` to describe objects arranged hierarchically in a :term:`resource tree`.  This tree is consulted by :term:`traversal` to map URLs to code.  In this application, the resource tree represents the site structure, but it *also* represents the :term:`domain model` of the application, because each resource is a node stored persistently in a :term:`ZODB` database.  The ``models.py`` file is where the ``zodb`` cookiecutter put the classes that implement our resource objects, each of which also happens to be a domain model object. A directory on disk can be turned into a Python :term:`package` by containing an ``__init__.py`` file.  Even if empty, this marks a directory as a Python package.  We use ``__init__.py`` both as a marker, indicating the directory in which it's contained is a package, and to contain application configuration code. Application configuration with ``__init__.py`` Basic Layout Bootstrapping is done by first seeing if the database has the persistent application root.  If not, we make an instance, store it, and commit the transaction.  We then return the application root object. Configuration in ``development.ini`` Here is the source for ``models.py``: Here is the source for ``views.py``: Let's try to understand the components in this module: Note the existence of a ``[app:main]`` section which specifies our WSGI application.  Our ZODB database settings are specified as the ``zodbconn.uri`` setting within this section.  This value, and the other values within this section, are passed as ``**settings`` to the ``main`` function we defined in ``__init__.py`` when the server is started via ``pserve``. Open ``tutorial/__init__.py``.  It should already contain the following: Our cookiecutter generated a default ``views.py`` on our behalf.  It contains a single view, which is used to render the page shown when you visit the URL ``http://localhost:6543/``. Resources and models with ``models.py`` Since this call to ``@view_config`` doesn't pass a ``name`` argument, the ``my_view`` function which it decorates represents the "default" view callable used when the context is of the type ``MyModel``. The ``@view_config`` decorator accepts a number of keyword arguments.  We use two keyword arguments here: ``context`` and ``renderer``. The ``context`` argument signifies that the decorated view callable should only be run when :term:`traversal` finds the ``tutorial.models.MyModel`` :term:`resource` to be the :term:`context` of a request.  In English, this means that when the URL ``/`` is visited, because ``MyModel`` is the root model, this view callable will be invoked. The ``development.ini`` (in the ``tutorial`` :term:`project` directory, as opposed to the ``tutorial`` :term:`package` directory) looks like this: The ``renderer`` argument names an :term:`asset specification` of ``templates/mytemplate.pt``.  This asset specification points at a :term:`Chameleon` template which lives in the ``mytemplate.pt`` file within the ``templates`` directory of the ``tutorial`` package.  And indeed if you look in the ``templates`` directory of this package, you'll see a ``mytemplate.pt`` template file, which renders the default home page of the generated project.  This asset specification is *relative* (to the view.py's current package).  Alternatively we could have used the absolute asset specification ``tutorial:templates/mytemplate.pt``, but chose to use the relative version. The function returns the dictionary ``{'project':'tutorial'}``.  This dictionary is used by the template named by the ``mytemplate.pt`` asset specification to fill in certain values on the page. The starter files generated by the ``zodb`` cookiecutter are very basic, but they provide a good orientation for the high-level patterns common to most :term:`traversal`-based (and :term:`ZODB`-based) :app:`Pyramid` projects. Views With ``views.py`` When you run the application using the ``pserve`` command using the ``development.ini`` generated configuration file, the application configuration points at a setuptools *entry point* described as ``egg:tutorial``.  In our application, because the application's ``setup.py`` file says so, this entry point happens to be the ``main`` function within the file named ``__init__.py``. Project-Id-Version: PROJECT VERSION
Report-Msgid-Bugs-To: EMAIL@ADDRESS
POT-Creation-Date: 2018-11-10 08:39+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 * 11è¡ç®ã `` __init __ãpy``ã¯ `` main``ã¨ããååã®é¢æ°ãå®ç¾©ãã¾ãã * 14è¡ç®ã `` pyramid_tm``ã©ã¤ããµã¤ã¯ã«ã®å¤ã§ããã¼ã¸ã£ã«è§¦ããã¨ãã«æé»çã«æ°ãããã©ã³ã¶ã¯ã·ã§ã³ãä½æããªãããã«ãã¢ããªã±ã¼ã·ã§ã³ã«æç¤ºçãªãã©ã³ã¶ã¯ã·ã§ã³ããã¼ã¸ã£ãä½¿ç¨ãã¾ãã * 15è¡ç®ã ï¼termï¼ `PasteDeploy`ã«ãã£ã¦è§£æãããsettingsã­ã¼ã¯ã¼ãã§ãï¼termï¼` Configurator`ãï¼termï¼ `context manager`ã¨ãã¦æ§ç¯ãã¾ãã * 16è¡ç®ã ï¼termï¼ `Chameleon`ãã³ãã¬ã¼ãã®ã¬ã³ããªã³ã°ãã¤ã³ãã£ã³ã°ããµãã¼ããã` `.pt``ãã³ãã¬ã¼ããä½¿ç¨ã§ãã¾ãã * 17è¡ç®ã `` pyramid_tm``ã®ãµãã¼ããå«ã¿ããã©ããããªã¯ã¨ã¹ãã ``ãã©ã³ã¶ã¯ã·ã§ã³ã«ãã£ã¦æä¾ãããã¢ã¯ãã£ããªãã©ã³ã¶ã¯ã·ã§ã³ã«åå ã§ããããã«ãã¾ã<https://pypi.org/project/transaction/> `_ããã±ã¼ã¸ã * 18è¡ç®ãä¸æçãªä¾å¤ãçºçããã¨ãã«ãªã¯ã¨ã¹ããåè©¦è¡ããããã® `` pyramid_retry``ã®ãµãã¼ããå«ã¿ã¾ãã * 19è¡ç®ã `` pyramid_zodbconn``ã®ãµãã¼ããå«ã¿ã¾ãï¼termï¼ `ZODB`ã¨Pyramidã¢ããªã±ã¼ã·ã§ã³ã®çµ±åãæä¾ãã¾ãã * 20è¡ç®ã `` root_factory``ã¨ããååã®é¢æ°ãä½¿ã£ã¦ã«ã¼ããã¡ã¯ããªãè¨­å®ãã¾ãã *ã©ã¤ã³21 *ã ï¼methï¼ `pyramid.config.Configurator.add_static_view`ã¡ã½ãããä½¿ã£ã¦URLãã¹ã` `/ static``ã§å§ã¾ããªã¯ã¨ã¹ãã«ç­ãã\&quot;ã¹ã¿ãã£ãã¯ãã¥ã¼\ &quot;ãç»é²ãã¾ãããã®ã¹ãã¼ãã¡ã³ãã¯ãCSSãç»åãã¡ã¤ã«ãªã©ã®éçã¢ã»ãããè¡¨ç¤ºãããã¥ã¼ãããã®å ´åã¯httpï¼// localhostï¼6543 / static / ``ä»¥ä¸ã«ç»é²ãã¾ããæåã®å¼æ°ã¯\ &quot;name \&quot; `` static``ã§ããããã¥ã¼ã®URLãã¹æ¥é ­è¾ã¯ `` / static``ã§ãããã¨ãç¤ºãã¾ãããã®ã¿ã°ã®2ã¤ç®ã®å¼æ°ã¯ãç¸å¯¾ãã¹ï¼termï¼ `asset specification`ã§ãã\&quot; path \ &quot;ã§ãããããã£ã¦ã` `tutorial``ããã±ã¼ã¸åã®` `static``ãã£ã¬ã¯ããªåã§ãµã¼ãã¹ããå¿è¦ããããªã½ã¼ã¹ãè¦ã¤ãã¾ãããããã¯ãcookiecutterã¯ãã¹ã¨ãã¦ï¼* `tutorialï¼static``ï¼*çµ¶å¯¾*è³ç£æå®ãä½¿ç¨ãããã¨ãã§ãã¾ããã * 22è¡ç®ã aï¼termï¼ `scan`ãå®è¡ãã¾ããã¹ã­ã£ã³ã§ã¯ã `` tutorial``ããã±ã¼ã¸ã®ã½ã¼ã¹ã³ã¼ãä¸­ã®ãã¥ã¼æ§æãã³ã¬ã¼ã¿ï¼ `` @ view_config``ãªã©ï¼ã®ãããªtermï¼ `configuration decoration`ãæ¤ç´¢ããããããã®ãã³ã¬ã¼ã¿ã«åºã¥ãã¦ã¢ã¯ã·ã§ã³ãå®è¡ããã¾ãã methï¼ `ãpyramid.config.Configurator.scan`ã«ã¯å¼æ°ãæ¸¡ãã¾ãããããã¯ãã¹ã­ã£ã³ãç¾å¨ã®ããã±ã¼ã¸ï¼ãã®å ´åã¯` `tutorial``ï¼ã§è¡ããããã¨ãæå³ãã¾ãã cookiecutterã¯ç­ä¾¡çã« `` config.scanï¼ &#39;tutorial&#39;ï¼ ``ã¨è¨ããã¨ãã§ãã¾ãããããã±ã¼ã¸åã®å¼æ°ãçç¥ãããã¨ãé¸æãã¾ããã * 23è¡ç®ã ï¼termï¼ `WSGI`ã¢ããªã±ã¼ã·ã§ã³ãè¿ãã«ã¯ï¼methï¼` pyramid.config.Configurator.make_wsgi_app`ã¡ã½ãããä½¿ãã¾ãã * 5è¡ç®ã ï¼funcï¼ `pyramid.view.view_config`ï¼termï¼` configuration decoration`ãä½¿ã£ã¦ï¼termï¼ `view configuration`ç»é²ãå®è¡ãã¦ãã ããããã®ãã¥ã¼æ§æã®ç»é²ã¯ãã¢ããªã±ã¼ã·ã§ã³ã®èµ·åæã«æå¹ã«ãªãã¾ããããã¯ãï¼termï¼ `scan`ï¼` `__init __ãpy``ã®14è¡ç®ãå®è¡ããã¦ããã¨ãï¼ã®çµæã¨ãã¦è¦ã¤ãåºããã¾ãã * 1-2è¡ç®ãããã¤ãã®ä¾å­é¢ä¿ã®ã¤ã³ãã¼ããå®è¡ãã¾ãã * 1ã3è¡ç®ãããã¤ãã®ä¾å­é¢ä¿ã®ã¤ã³ãã¼ããå®è¡ãã¾ãã * 4-5è¡ç®ã `` MyModel``ï¼termï¼ `resource`ã¯ã©ã¹ãããã«å®è£ããã¦ãã¾ãããã®ã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ã¯ï¼classï¼ `persistent.mapping.PersistentMapping`ã¯ã©ã¹ããç¶æ¿ãããããtermï¼` ZODB`ã«æ°¸ç¶åãããã¨ãã§ãã¾ãã `` __parent__``ã¨ `` __name__``ã¯ï¼termï¼ `traversal`ãã­ãã³ã«ã®éè¦ãªé¨åã§ããããã©ã«ãã§ã¯ãããããï¼termï¼ `ã«ã¼ã`ãªãã¸ã§ã¯ãã§ãããã¨ãç¤ºãããã« `` None``ã«è¨­å®ãã¦ãã ããã *ã©ã¤ã³6-7 *ãç§ãã¡ã¯ä¸è¨ã®ã¹ãããã§é£¾ã£ãï¼termï¼ `view callable`ã` `my_view``ã¨å®ç¾©ãã¾ãããã®å¼ã³åºãå¯è½ãªãã¥ã¼ã¯ `` zodb`` cookiecutterã«ãã£ã¦çæããã `` request``ãä¸ããããè¾æ¸ãè¿ã*é¢æ°*ã§ããä¸è¨ã®ã¹ãããã§ã¢ã»ããä»æ§ã§æå®ããã `` mytemplate.pt`ï¼termï¼ `renderer`ã¯ããã®è¾æ¸ãç§ãã¡ã«ä»£ãã£ã¦ï¼termï¼` response`ã«å¤æãã¾ãã *ã©ã¤ã³6-8 *ã Pyramidã¢ããªã±ã¼ã·ã§ã³ã®ããã®ï¼termï¼ `root factory`ãå®ç¾©ãã¦ãã ããã * 8-12è¡ç®ã `` appmaker``ã¯*ã¢ããªã±ã¼ã·ã§ã³ã«ã¼ã*ãªãã¸ã§ã¯ããè¿ãããã«ä½¿ããã¾ããããã¯ï¼appï¼ `Pyramid`ã¢ããªã±ã¼ã·ã§ã³ã¸ã®ãªã¯ã¨ã¹ã*æ¯ã«å¼ã³åºããã¾ããã¾ããï¼ZODBã«ã¼ããªãã¸ã§ã¯ãã®åé¨ã«ï¼ã¢ããªã±ã¼ã·ã§ã³ã«ã¼ããå­å¨ããªãå ´åã¯*ä½æ*ãããã¨ã«ãã£ã¦ãã¼ãã¹ãã©ãããå®è¡ãã¾ããããã¯ `` __init __ãpy``ã§å®ç¾©ãã `` root_factory``ã§ä½¿ç¨ããã¾ãã ï¼appï¼ `Pyramid`ã¯ï¼termï¼` resource`ã¨ããåèªãä½¿ã£ã¦éå±¤çã«éåããããªãã¸ã§ã¯ããè¨è¿°ãã¾ãããã®ããªã¼ã¯ï¼termï¼ `traversal`ã«ãã£ã¦åç§ãããURLãã³ã¼ãã«ããããã¾ãããã®ã¢ããªã±ã¼ã·ã§ã³ã§ã¯ããªã½ã¼ã¹ããªã¼ã¯ãµã¤ãæ§é ãè¡¨ãã¾ãããåãªã½ã¼ã¹ã¯ï¼termï¼ `ZODB`ãã¼ã¿ãã¼ã¹ã«æ°¸ç¶çã«æ ¼ç´ããã¦ãããããã¢ããªã±ã¼ã·ã§ã³ã®ï¼termï¼` domain model`ãè¡¨ãã¾ãã `` models.py``ãã¡ã¤ã«ã¯ã `` zodb`` cookiecutterãç§ãã¡ã®ãªã½ã¼ã¹ãªãã¸ã§ã¯ããå®è£ããã¯ã©ã¹ãç½®ãã¨ããã§ããããããã¯ãã¡ã¤ã³ã¢ãã«ãªãã¸ã§ã¯ãã§ãã ãã£ã¹ã¯ä¸ã®ãã£ã¬ã¯ããªã¯ `` __init __ãpy``ãã¡ã¤ã«ãå«ããã¨ã§ãPythonï¼termï¼ `package`ã«å¤æãããã¨ãã§ãã¾ãããã¨ãç©ºã§ãã£ã¦ããããã¯ãã£ã¬ã¯ããªãPythonããã±ã¼ã¸ã¨ãã¦ãã¼ã¯ãã¾ãã `` __init __ãpy``ã¯ããã±ã¼ã¸ã®ãã£ã¬ã¯ããªãç¤ºããã¼ã«ã¼ã¨ãã¦ãããã¦ã¢ããªã±ã¼ã·ã§ã³ã®è¨­å®ã³ã¼ããæ ¼ç´ããããã®ãã¼ã«ã¼ã¨ãã¦ä½¿ããã¾ãã `` __init __ãpy``ã«ããã¢ããªã±ã¼ã·ã§ã³æ§æ (æ©æ¢°ç¿»è¨³)åºæ¬ã¬ã¤ã¢ã¦ã ãã¼ãã¹ãã©ããã¯ããã¼ã¿ãã¼ã¹ã«æ°¸ç¶çãªã¢ããªã±ã¼ã·ã§ã³ã«ã¼ãããããã©ããæåã«ç¢ºèªãããã¨ã«ãã£ã¦è¡ããã¾ããããã§ãªãå ´åã¯ãã¤ã³ã¹ã¿ã³ã¹ãä½æãã¦æ ¼ç´ãããã©ã³ã¶ã¯ã·ã§ã³ãã³ããããã¾ããæ¬¡ã«ãã¢ããªã±ã¼ã·ã§ã³ã«ã¼ããªãã¸ã§ã¯ããè¿ãã¾ãã `` development.ini``ã®è¨­å® `` models.py``ã®ã½ã¼ã¹ã¯æ¬¡ã®ã¨ããã§ãï¼ `` views.py``ã®ã½ã¼ã¹ã¯æ¬¡ã®ã¨ããã§ãï¼ ãã®ã¢ã¸ã¥ã¼ã«ã®ã³ã³ãã¼ãã³ããçè§£ãããã¨ãã¾ãããï¼ ç§ãã¡ã®WSGIã¢ããªã±ã¼ã·ã§ã³ãæå®ãã `` [appï¼main] ``ã»ã¯ã·ã§ã³ãå­å¨ãããã¨ã«æ³¨æãã¦ãã ããã ZODBã®ãã¼ã¿ãã¼ã¹è¨­å®ã¯ããã®ã»ã¯ã·ã§ã³åã® `` zodbconn.uri``è¨­å®ã¨ãã¦æå®ããã¦ãã¾ãããã®å¤ã¨ãã®ã»ã¯ã·ã§ã³åã®ä»ã®å¤ã¯ããµã¼ãã `` pserve``ã§èµ·åãããã¨ãã« `` __init __ãpy``ã§å®ç¾©ãã `` main``é¢æ°ã« `` **è¨­å®&#39;`ã¨ãã¦æ¸¡ããã¾ãã ã ``ãã¥ã¼ããªã¢ã«/ __ init __ãpy``ãéãã¾ããããã¯ãã§ã«ä»¥ä¸ãå«ãã§ããã¯ãã§ãï¼ ç§ãã¡ã®cookiecutterã¯ããã©ã«ãã§ `` views.py``ãçæãã¾ãããããã¯åä¸ã®ãã¥ã¼ãå«ã¿ã `` httpï¼// localhostï¼6543 / ``ã¨ããURLã«ã¢ã¯ã»ã¹ããã¨ãã«è¡¨ç¤ºããããã¼ã¸ãã¬ã³ããªã³ã°ããããã«ä½¿ç¨ããã¾ãã `` models.py``ãä½¿ã£ããªã½ã¼ã¹ã¨ã¢ãã« `` @ view_config``ã¸ã®ãã®å¼ã³åºãã¯ `` name``å¼æ°ãæ¸¡ããªãã®ã§ããããè£é£¾ãã `` my_view``é¢æ°ã¯ãã³ã³ãã­ã¹ãã ` `MyModel``ã `` @ view_config``ãã³ã¬ã¼ã¿ã¯ããã¤ãã®ã­ã¼ã¯ã¼ãå¼æ°ãåãåãã¾ããããã§ã¯ã `` context``ã¨ `` renderer``ã®2ã¤ã®ã­ã¼ã¯ã¼ãå¼æ°ãä½¿ç¨ãã¾ãã `` context``å¼æ°ã¯ã `` traversal``ã `` tutorial.models.MyModel``ï¼termï¼ `resource`ãï¼termï¼` context`ã«ããã¨ãã«ã®ã¿å¼ã³åºãå¯è½ãªè£é£¾ãã¥ã¼callableãå®è¡ããå¿è¦ããããã¨ãæå³ãã¾ããè¦æ±ã®è±èªã§ã¯ã `` MyModel``ãã«ã¼ãã¢ãã«ã§ãããããURL `` / ``ãè¨ªããã¨ãã«ããã®ãã¥ã¼ãå¼ã³åºããã¨ãã§ãã¾ãã ``ãã¥ã¼ããªã¢ã« `ï¼ãã¥ã¼ããªã¢ã«` `ï¼` `ãã¥ã¼ããªã¢ã«` `ã®` `ãã¥ã¼ããªã¢ã«` `ã§ã¯ãªã` `ãã¥ã¼ããªã¢ã«` `ã®` `development.ini``ã¯ä»¥ä¸ã®ããã«ãªãã¾ãï¼ `` renderer``å¼æ°ã¯ã `` templates / mytemplate.pt``ã® `` asset specification``ã¨ããååã§ãããã®è³ç£æå®ã¯ã `` tutorial``ããã±ã¼ã¸ã® `` templates``ãã£ã¬ã¯ããªåã® `` mytemplate.pt``ãã¡ã¤ã«ã«å­å¨ããaï¼termï¼ `Chameleon`ãã³ãã¬ã¼ããæãã¦ãã¾ããã¾ãããã®ããã±ã¼ã¸ã® `` templates``ãã£ã¬ã¯ããªãè¦ãã¨ã `` mytemplate.pt``ãã³ãã¬ã¼ããã¡ã¤ã«ãè¡¨ç¤ºãããçæããããã­ã¸ã§ã¯ãã®ããã©ã«ãã®ãã¼ã ãã¼ã¸ãã¬ã³ããªã³ã°ãã¾ãããã®è³ç£ã®ä»æ§ã¯* relative *ï¼ç¾å¨ã®view.pyã®ããã±ã¼ã¸ï¼ã§ãããããã¯ãçµ¶å¯¾çãªè³ç£ã®ä»æ§ãtutorialï¼templates / mytemplate.ptããä½¿ç¨ãããã¨ãã§ãã¾ããããç¸å¯¾ãã¼ã¸ã§ã³ãä½¿ç¨ãããã¨ãé¸æãã¾ããã ãã®é¢æ°ã¯è¾æ¸ `` {&#39;project&#39;ï¼ &#39;tutorial&#39;} ``ãè¿ãã¾ãããã®è¾æ¸ã¯ã &quot;mytemplate.pt&quot;ã®è³ç£æå®ã§æå®ããããã³ãã¬ã¼ãã«ãã£ã¦ä½¿ç¨ããããã¼ã¸ä¸ã®ç¹å®ã®å¤ãå¥åãã¾ãã `` zodb`` cookiecutterã«ãã£ã¦çæãããã¹ã¿ã¼ã¿ã¼ãã¡ã¤ã«ã¯éå¸¸ã«åºæ¬çã§ãããæãä¸è¬çãªç¨èªã§ãã `` traversal``ï¼andï¼termï¼ `ZODB`ãã¼ã¹ï¼ ï¼appï¼ `Pyramid`ãã­ã¸ã§ã¯ãã `` views.py``ã«ãããã¥ã¼ `` development.ini``çæãããè¨­å®ãã¡ã¤ã«ãä½¿ã£ã¦ `` pserve``ã³ãã³ããä½¿ã£ã¦ã¢ããªã±ã¼ã·ã§ã³ãå®è¡ããã¨ãã¢ããªã±ã¼ã·ã§ã³ã®è¨­å®ã¯ `` eggï¼tutorial``ã¨è¨è¿°ãããsetuptools *ã¨ã³ããªãã¤ã³ããæãã¦ãã¾ããç§ãã¡ã®ã¢ããªã±ã¼ã·ã§ã³ã§ã¯ãã¢ããªã±ã¼ã·ã§ã³ã® `` setup.py``ãã¡ã¤ã«ãããè¨ã£ã¦ããã®ã§ããã®ã¨ã³ããªãã¤ã³ãã¯ `` __init __ãpy``ã¨ããååã®ãã¡ã¤ã«åã® `` main``é¢æ°ã§ãã 