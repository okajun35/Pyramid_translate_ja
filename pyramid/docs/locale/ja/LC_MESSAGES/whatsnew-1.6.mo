Þ    .                    ü  2  ý  l   0  é     Æ      N     m  §   ñ     	  Ä  7
     ü      U   ³     	          1  ]  C  ®   ¡  8  P  o     å  ù  §   ß  }        =    ÿ   Ñ  #   Ñ      õ  t          _   $  }     Ê    R  Í   ê    "  ¨  #  µ   ´$  ±   j%  9  &  ,  V'     (  ì   (  û   )  j   *     ñ*    +    /    0  ´   2  P  Î2  [  4  N  {6  ª   Ê7  ï   u8  ì   e9  þ  R:     Q?  $  g?  a   A     îA  !   õA     B  É  'B  ñ   ñC  \  ãD     @F    ÙF  Ô   ÜJ  ß  ±K    M  o  ¨O  ~  Q  $   R  Æ   ¼R  ¤   S     (T  }   8T  ½   ¶T  x  tU    íW  /  Y  ¶  ½Z  ò   t\  Ø   g]  b  @^  h  £_  %   a  7  2a  7  jb  ª   ¢c  Æ   Md  ©  e   Add :func:`pyramid.request.apply_request_extensions` function which can be used in testing to apply any request extensions configured via ``config.add_request_method``. Previously it was only possible to test the extensions by going through Pyramid's router. See https://github.com/Pylons/pyramid/pull/1581 Add documentation of command line programs (``p*`` scripts). See https://github.com/Pylons/pyramid/pull/2191 Add new HTTP exception objects for status codes ``428 Precondition Required``, ``429 Too Many Requests`` and ``431 Request Header Fields Too Large`` in ``pyramid.httpexceptions``. See https://github.com/Pylons/pyramid/pull/1372/files Added :attr:`pyramid.config.Configurator.root_package` attribute and init parameter to assist with includible packages that wish to resolve resources relative to the package in which the configurator was created. This is especially useful for add-ons that need to load asset specs from settings, in which case it may be natural for a developer to define imports or assets relative to the top-level package. See https://github.com/Pylons/pyramid/pull/1337 Added :meth:`~pyramid.config.Configurator.set_response_factory` and the ``response_factory`` keyword argument to the constructor of :class:`~pyramid.config.Configurator` for defining a factory that will return a custom ``Response`` class. See https://github.com/Pylons/pyramid/pull/1499 Added line numbers to the log formatters in the scaffolds to assist with debugging. See https://github.com/Pylons/pyramid/pull/1326 Additional shells for ``pshell`` can now be registered as entry points. See https://github.com/Pylons/pyramid/pull/1891 and https://github.com/Pylons/pyramid/pull/2012 Allow an iterator to be returned from a renderer. Previously it was only possible to return bytes or unicode. See https://github.com/Pylons/pyramid/pull/1417 Assets can now be overidden by an absolute path on the filesystem when using the :meth:`~pyramid.config.Configurator.override_asset` API. This makes it possible to fully support serving up static content from a mutable directory while still being able to use the :meth:`~pyramid.request.Request.static_url` API and :meth:`~pyramid.config.Configurator.add_static_view`.  Previously it was not possible to use :meth:`~pyramid.config.Configurator.add_static_view` with an absolute path **and** generate urls to the content. This change replaces the call, ``config.add_static_view('/abs/path', 'static')``, with ``config.add_static_view('myapp:static', 'static')`` and ``config.override_asset(to_override='myapp:static/', override_with='/abs/path/')``. The ``myapp:static`` asset spec is completely made up and does not need to existâit is used for generating URLs via ``request.static_url('myapp:static/foo.png')``. See https://github.com/Pylons/pyramid/issues/1252 Backwards Incompatibilities Cache busting for static resources has been added and is available via a new :meth:`pyramid.config.Configurator.add_cache_buster` API. Core APIs are shipped for both cache busting via query strings and via asset manifests for integrating into custom asset pipelines. See https://github.com/Pylons/pyramid/pull/1380 and https://github.com/Pylons/pyramid/pull/1583 and https://github.com/Pylons/pyramid/pull/2171 Clarify a previously-implied detail of the ``ISession.invalidate`` API documentation. Deprecations Documentation Enhancements Feature Additions IPython and BPython support have been removed from pshell in the core. To continue using them on Pyramid 1.6+, you must install the binding packages explicitly. One way to do this is by adding ``pyramid_ipython`` (or ``pyramid_bpython``) to the ``install_requires`` section of your package's ``setup.py`` file, then re-running ``setup.py develop``:: Improve and clarify the documentation on what :app:`Pyramid` defines as a ``principal`` and a ``userid`` in its security APIs. See https://github.com/Pylons/pyramid/pull/1399 Improve robustness to timing attacks in the :class:`~pyramid.authentication.AuthTktCookieHelper` and the :class:`~pyramid.session.SignedCookieSessionFactory` classes by using the stdlib's ``hmac.compare_digest`` if it is available (such as Python 2.7.7+ and 3.3+). See https://github.com/Pylons/pyramid/pull/1457 Improve the readability of the ``pcreate`` shell script output. See https://github.com/Pylons/pyramid/pull/1453 In an effort to combat a common issue it is now a :class:`~pyramid.exceptions.ConfigurationError` to register a view callable that is actually an unbound method when using the default view mapper. As unbound methods do not exist in PY3+ possible errors are detected by checking if the first parameter is named ``self``. For example, `config.add_view(ViewClass.some_method, ...)` should actually be `config.add_view(ViewClass, attr='some_method)'`. This was always an issue in Pyramid on PY2 but the backward incompatibility is on PY3+ where you may not use a function with the first parameter named ``self``. In this case it looks too much like a common error and the exception will be raised. See https://github.com/Pylons/pyramid/pull/1498 Make it possible to subclass ``pyramid.request.Request`` and also use ``pyramid.request.Request.add_request.method``. See https://github.com/Pylons/pyramid/issues/1529 Make it simple to define ``notfound`` and ``forbidden`` views that wish to use the default exception-response view, but with altered predicates and other configuration options. The ``view`` argument is now optional in :meth:`~pyramid.config.Configurator.add_notfound_view` and :meth:`~pyramid.config.Configurator.add_forbidden_view` See https://github.com/Pylons/pyramid/issues/494 Moved the documentation for ``accept`` on :meth:`pyramid.config.Configurator.add_view` to no longer be part of the predicate list. See https://github.com/Pylons/pyramid/issues/1391 for a bug report stating ``not_`` was failing on ``accept``. Discussion with @mcdonc led to the conclusion that it should not be documented as a predicate. See https://github.com/Pylons/pyramid/pull/1487 for this PR. Overall improvements for the ``proutes`` command. Added ``--format`` and ``--glob`` arguments to the command, introduced the ``method`` column for displaying available request methods, and improved the ``view`` output by showing the module instead of just ``__repr__``. See https://github.com/Pylons/pyramid/pull/1488 Please use a real process manager in the future instead of relying on ``pserve`` to daemonize itself. Many options exist, including your operating system's services, such as Systemd or Upstart, as well as Python-based solutions like Circus and Supervisor. Python 3.5 and pypy3 compatibility. Removed logging configuration from Quick Tutorial ``ini`` files, except for scaffolding- and logging-related chapters, to avoid needing to explain it too early. Removed non-ASCII copyright symbol from templates, as this was causing the scaffolds to fail for project generation. Scaffolding Enhancements See https://github.com/Pylons/pyramid/pull/1641 and https://github.com/Pylons/pyramid/pull/2120 Support keyword-only arguments and function annotations in views in Python 3. See https://github.com/Pylons/pyramid/pull/1556 The :class:`~pyramid.config.Configurator` has grown the ability to allow actions to call other actions during a commit cycle. This enables much more logic to be placed into actions, such as the ability to invoke other actions or group them for improved conflict detection. We have also exposed and documented the configuration phases that Pyramid uses in order to further assist in building conforming add-ons. See https://github.com/Pylons/pyramid/pull/1513 The ``append_slash`` argument of :meth:`~pyramid.config.Configurator.add_notfound_view()` will now accept anything that implements the :class:`~pyramid.interfaces.IResponse` interface and will use that as the response class instead of the default :class:`~pyramid.httpexceptions.HTTPFound`. See https://github.com/Pylons/pyramid/pull/1610 The ``principal`` argument to :func:`pyramid.security.remember` was renamed to ``userid``. Using ``principal`` as the argument name still works and will continue to work for the next few releases, but a deprecation warning is printed. The ``pserve`` command's daemonization features, as well as ``--monitor-restart``, have been deprecated. This includes the ``[start,stop,restart,status]`` subcommands, as well as the ``--daemon``, ``--stop-daemon``, ``--pid-file``, ``--status``, ``--user``, and ``--group`` flags. See https://github.com/Pylons/pyramid/pull/2120 and https://github.com/Pylons/pyramid/pull/2189 and https://github.com/Pylons/pyramid/pull/1641 The ``pshell`` script will now load a ``PYTHONSTARTUP`` file if one is defined in the environment prior to launching the interpreter. See https://github.com/Pylons/pyramid/pull/1448 The variables injected into ``pshell`` are now displayed with their docstrings instead of the default ``str(obj)`` when possible. See https://github.com/Pylons/pyramid/pull/1929 This article explains the new features in :app:`Pyramid` version 1.6 as compared to its predecessor, :app:`Pyramid` 1.5. It also documents backwards incompatibilities between the two versions and deprecations added to :app:`Pyramid` 1.6, as well as software dependency changes and notable documentation additions. Updated scaffold generating machinery to return the version of :app:`Pyramid` and its documentation for use in scaffolds. Updated ``starter``, ``alchemy`` and ``zodb`` templates to have links to correctly versioned documentation, and to reflect which :app:`Pyramid` was used to generate the scaffold. What's New in Pyramid 1.6 ``pcreate`` when run without a scaffold argument will now print information on the missing flag, as well as a list of available scaffolds. See https://github.com/Pylons/pyramid/pull/1566 and https://github.com/Pylons/pyramid/issues/1297 ``pcreate`` will now ask for confirmation if invoked with an argument for a project name that already exists or is importable in the current environment. See https://github.com/Pylons/pyramid/issues/1357 and https://github.com/Pylons/pyramid/pull/1837 ``pserve --reload`` will no longer crash on syntax errors. See https://github.com/Pylons/pyramid/pull/2044 ``pserve`` can now take a ``-b`` or ``--browser`` option to open the server URL in a web browser. See https://github.com/Pylons/pyramid/pull/1533 ``request.response`` will no longer be mutated when using the :func:`~pyramid.renderers.render_to_response` API. It is now necessary to pass in a ``response=`` argument to :func:`~pyramid.renderers.render_to_response` if you wish to supply the renderer with a custom response object. If you do not pass one, then a response object will be created using the current response factory. Almost all renderers mutate the ``request.response`` response object (for example, the JSON renderer sets ``request.response.content_type`` to ``application/json``). However, when invoking ``render_to_response``, it is not expected that the response object being returned would be the same one used later in the request. The response object returned from ``render_to_response`` is now explicitly different from ``request.response``. This does not change the API of a renderer. See https://github.com/Pylons/pyramid/pull/1563 Project-Id-Version: PROJECT VERSION
Report-Msgid-Bugs-To: EMAIL@ADDRESS
POT-Creation-Date: 2018-11-03 14:33+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 Addï¼funcï¼ `pyramid.request.apply_request_extensions`é¢æ°ã¯ã` `config.add_request_method``ã§è¨­å®ããããªã¯ã¨ã¹ãæ¡å¼µãé©ç¨ããããã®ãã¹ãã«ä½¿ç¨ã§ãã¾ããä»¥åã¯ãPyramidã®ã«ã¼ã¿ã¼ãçµç±ãã¦æ¡å¼µæ©è½ããã¹ããããã¨ããã§ãã¾ããã§ããã https://github.com/Pylons/pyramid/pull/1581ãåç§ãã¦ãã ããã ã³ãã³ãã©ã¤ã³ãã­ã°ã©ã ã®ãã­ã¥ã¡ã³ããè¿½å ããï¼ `` p * ``ã¹ã¯ãªããï¼ã https://github.com/Pylons/pyramid/pull/2191ãåç§ãã¦ãã ããã `` pyramid.httpexceptions``ã®ã¹ãã¼ã¿ã¹ã³ã¼ã `` 428åææ¡ä»¶å¿é  &quot;ã&quot; 429 &quot;ã&quot; 431ãªã¯ã¨ã¹ãããããã£ã¼ã«ããå¤§ãããã¾ã &quot;ã¨ããæ°ããHTTPä¾å¤ãªãã¸ã§ã¯ããè¿½å ãã¾ããã https://github.com/Pylons/pyramid/pull/1372/filesãåç§ãã¦ãã ããã è¿½å ï¼attrï¼ `pyramid.config.Configurator.root_package`å±æ§ã¨initãã©ã¡ã¼ã¿ã¯ãã³ã³ãã£ã°ã¬ã¼ã¿ãä½æãããããã±ã¼ã¸ã«é¢é£ãããªã½ã¼ã¹ãè§£æ±ºããããã®includibleããã±ã¼ã¸ãæ¯æ´ãã¾ããããã¯ãè¨­å®ããã¢ã»ããä»æ§ãã­ã¼ãããå¿è¦ã®ããã¢ããªã³ã§ç¹ã«å½¹ã«ç«ã¡ã¾ãããã®å ´åãéçºèããããã¬ãã«ããã±ã¼ã¸ãåºæºã«ãã¦ã¤ã³ãã¼ãã¾ãã¯ã¢ã»ãããå®ç¾©ããã®ã¯èªç¶ããããã¾ããã https://github.com/Pylons/pyramid/pull/1337ãåç§ãã¦ãã ããã è¿½å ãããï¼methï¼ `ãpyramid.config.Configurator.set_response_factory`ã¨` `response_factory``ã­ã¼ã¯ã¼ãã¯ãclassï¼`ãpyramid.config.Configurator`ã®ã³ã³ã¹ãã©ã¯ã¿ã®ã­ã¼ã¯ã¼ãå¼æ°ã§ãã«ã¹ã¿ã ã® `` Response ``ã¯ã©ã¹ã https://github.com/Pylons/pyramid/pull/1499ãåç§ãã¦ãã ããã ãããã°ãæ¯æ´ããè¶³å ´ã®ã­ã°ãã©ã¼ããã¿ã«è¡çªå·ãè¿½å ãã¾ããã https://github.com/Pylons/pyramid/pull/1326ãåç§ãã¦ãã ããã `` pshell``ç¨ã®è¿½å ã®ã·ã§ã«ãã¨ã³ããªãã¤ã³ãã¨ãã¦ç»é²ã§ããããã«ãªãã¾ããã https://github.com/Pylons/pyramid/pull/1891ããã³https://github.com/Pylons/pyramid/pull/2012ãåç§ãã¦ãã ããã ã¤ãã¬ã¼ã¿ãã¬ã³ãã©ããè¿ãããããã«ãã¾ããä»¥åã¯ããã¤ãã¾ãã¯ã¦ãã³ã¼ããè¿ããã¨ããã§ãã¾ããã§ããã https://github.com/Pylons/pyramid/pull/1417ãåç§ãã¦ãã ããã ã¢ã»ããã¯ãï¼methï¼ `ãpyramid.config.Configurator.override_asset` APIãä½¿ç¨ããã¨ãããã¡ã¤ã«ã·ã¹ãã ä¸ã®çµ¶å¯¾ãã¹ã«ãã£ã¦ä¸æ¸ããããããã«ãªãã¾ãããããã«ãããå¤æ´å¯è½ãªãã£ã¬ã¯ããªããã®éçã³ã³ãã³ãã®éä¿¡ãå®å¨ã«ãµãã¼ãããªãããï¼methï¼ `ãpyramid.request.Request.static_url` APIã¨ï¼methï¼`ãpyramid.config.Configurator.add_static_view` ãä»¥åã¯ï¼methï¼ `ãpyramid.config.Configurator.add_static_view`ãçµ¶å¯¾ãã¹ã§ä½¿ç¨ãããã¨ã¯ã§ãã¾ããã§ãã**ã¨**ã³ã³ãã³ãã«URLãçæãã¾ãããã®å¤æ´ã¯ `` config.add_static_viewï¼ &#39;/ abs / path&#39;ã &#39;static&#39;ï¼ ``ã `` config.add_static_viewï¼ &#39;myappï¼static&#39;ã &#39;static&#39;ï¼ ``ã¨ `` config &#39;ã«ç½®ãæãã¾ãã override_assetï¼to_override = &#39;myappï¼static /&#39;ãoverride_with = &#39;/ abs / path /&#39;ï¼ ``ã§ãã `` myappï¼static``ã¢ã»ããä»æ§ã¯å®å¨ã«ä½ããã¦ãããå­å¨ããå¿è¦ã¯ããã¾ãããããã¯ `` request.static_urlï¼ &#39;myappï¼static / foo.png&#39;ï¼ ``ã§URLãçæããããã«ä½¿ç¨ããã¾ãã https://github.com/Pylons/pyramid/issues/1252ãåç§ãã¦ãã ããã å¾æ¹ã®éäºææ§ éçãªã½ã¼ã¹ç¨ã®ã­ã£ãã·ã¥ç ´æ£ãè¿½å ãããæ°ããï¼methï¼ `pyramid.config.Configurator.add_cache_buster` APIãä»ãã¦å©ç¨ã§ãã¾ããã³ã¢APIã¯ãã¯ã¨ãªæå­åãä»ããã­ã£ãã·ã¥ç ´æ£ã¨ãã«ã¹ã¿ã ã¢ã»ãããã¤ãã©ã¤ã³ã¸ã®çµ±åã®ããã®ã¢ã»ãããããã§ã¹ããä½¿ç¨ãã¦åºè·ããã¾ãã https://github.com/Pylons/pyramid/pull/1380ããã³https://github.com/Pylons/pyramid/pull/1583ããã³https://github.com/Pylons/pyramid/pull/2171ãåç§ãã¦ãã ããã `` ISession.invalidate`` APIãã­ã¥ã¡ã³ãã®æé»ã®è©³ç´°ãæç¢ºã«ãã¦ãã ããã å»æ­¢ ãã­ã¥ã¡ã³ãã®æ©è½æ¡å¼µ æ©è½ã®è¿½å  IPythonã¨BPythonã®ãµãã¼ãã¯ã³ã¢ã®pshellããåé¤ããã¾ããã Pyramid 1.6ä»¥éã§å¼ãç¶ãä½¿ç¨ããã«ã¯ããã¤ã³ãã£ã³ã°ããã±ã¼ã¸ãæç¤ºçã«ã¤ã³ã¹ãã¼ã«ããå¿è¦ãããã¾ãããããè¡ã1ã¤ã®æ¹æ³ã¯ãããã±ã¼ã¸ã® `` setup.py``ãã¡ã¤ã«ã® `` install_requires``ã»ã¯ã·ã§ã³ã« `` pyramid_ipython``ï¼ã¾ãã¯ `` pyramid_bpython``ï¼ãè¿½å ãã¦ããã `` setup.pyéçº `:: appï¼ `Pyramid`ãã»ã­ã¥ãªãã£APIã®` `principal``ã¨` `userid``ã¨ãã¦å®ç¾©ãã¦ãããã®ã«é¢ãããã­ã¥ã¡ã³ããæ¹åãæç¢ºã«ãã¾ãã https://github.com/Pylons/pyramid/pull/1399ãåç§ãã¦ãã ããã classï¼ `ãpyramid.authentication.AuthTktCookieHelper`ã¯ã©ã¹ã¨ï¼classï¼`ãpyramid.session.SignedCookieSessionFactory`ã¯ã©ã¹ã§ã¿ã¤ãã³ã°æ»æã«å¯¾ããå ç¢æ§ãåä¸ãããã«ã¯ãstdlibã® `` hmac.compare_digest`` Python 2.7.7+ããã³3.3+ï¼ã https://github.com/Pylons/pyramid/pull/1457ãåç§ãã¦ãã ããã `` pcreate``ã·ã§ã«ã¹ã¯ãªããåºåã®å¯èª­æ§ãåä¸ããã¾ãã https://github.com/Pylons/pyramid/pull/1453ãåç§ãã¦ãã ããã å±éã®åé¡ã«å¯¾å¦ããããã«ãclassï¼ `ãpyramid.exceptions.ConfigurationError`ã¯ããã©ã«ãã®ãã¥ã¼ãããã¼ãä½¿ç¨ãã¦ããã¨ãã«å®éã«ã¯ã¢ã³ãã¤ã³ãããããã¥ã¼ã§ãããã¥ã¼å¼ã³åºãå¯è½ãªãã¸ã§ã¯ããç»é²ãã¾ããçµåããã¦ããªãã¡ã½ãããPY3 +ã«å­å¨ããªããããå¯è½ãªã¨ã©ã¼ã¯ãæåã®ãã©ã¡ã¼ã¿ã®ååã `` self``ã§ãããã©ãããèª¿ã¹ããã¨ã«ãã£ã¦æ¤åºããã¾ãããã¨ãã°ã `config.add_viewï¼ViewClass.some_methodã...ï¼`ã¯å®éã«ã¯ `config.add_viewï¼ViewClassãattr = &#39;some_methodï¼&#39;ã§ããããã¯PY2ã®Pyramidã§ã¯å¸¸ã«åé¡ã§ããããå¾æ¹äºææ§ã¯PY3 +ã«ããã¾ããããã§ã¯ã `` self``ã¨ããååã®æåã®ãã©ã¡ã¼ã¿ã§é¢æ°ãä½¿ç¨ãããã¨ã¯ã§ãã¾ããããã®å ´åãä¸è¬çãªã¨ã©ã¼ã®ããã«è¦ããä¾å¤ãçºçãã¾ãã https://github.com/Pylons/pyramid/pull/1498ãåç§ãã¦ãã ããã `` pyramid.request.Request``ããµãã¯ã©ã¹åãã `` pyramid.request.Request.add_request.method``ãä½¿ããã¨ãå¯è½ã§ãã https://github.com/Pylons/pyramid/issues/1529ãåç§ãã¦ãã ããã ããã©ã«ãã®ä¾å¤å¿ç­ãã¥ã¼ãä½¿ç¨ãããããå¤æ´ãããè¿°èªããã®ä»ã®è¨­å®ãªãã·ã§ã³ãä½¿ç¨ãã `` notfound``ã¨ `` forbidden``ãã¥ã¼ãç°¡åã«å®ç¾©ã§ããããã«ãã¾ãã `` view``å¼æ°ã¯ãmethï¼ `ãpyramid.config.Configurator.add_notfound_view`ã¨ï¼methï¼`ãpyramid.config.Configurator.add_forbidden_ââview`ã®ãªãã·ã§ã³ã§ããhttps://github.com/Pylons/pyramidãåç§ãã¦ãã ããã / issues / 494 methï¼ `pyramid.config.Configurator.add_view`ã` `accept``ã®ããã«ãã­ã¥ã¡ã³ãããã¯ãè¿°èªãªã¹ãã®ä¸é¨ã«ç§»åãã¾ããã§ããã `` not_``ã `` accept``ã§å¤±æããã¨ãããã°ã¬ãã¼ãã«ã¤ãã¦ã¯ãhttps://github.com/Pylons/pyramid/issues/1391ãåç§ãã¦ãã ããã @mcdoncã¨ã®è­°è«ã¯ããããè¿°èªã¨ãã¦ææ¸åãããã¹ãã§ã¯ãªãã¨ããçµè«ã«å°ããããã®PRã«ã¤ãã¦ã¯ãhttps://github.com/Pylons/pyramid/pull/1487ãåç§ãã¦ãã ããã `` proutes``ã³ãã³ãã®å¨ä½çãªæ¹è¯ãã³ãã³ãã« `` --format``ã¨ `` --glob``å¼æ°ãè¿½å ããå©ç¨å¯è½ãªãªã¯ã¨ã¹ãã¡ã½ãããè¡¨ç¤ºããããã® `` method``ã«ã©ã ãå°å¥ãã `` view``ã®åºåãæ¹åãã¾ãããã¡ããã© `` __repr__``ã§ãã https://github.com/Pylons/pyramid/pull/1488ãåç§ãã¦ãã ããã `` pserve``ã«ä¾å­ããã®ã§ã¯ãªããå®éã®ãã­ã»ã¹ããã¼ã¸ã£ã¼ãä½¿ã£ã¦ãèªåèªèº«ããã¼ã¢ã³åãã¦ãã ãããããªãã®ãªãã¬ã¼ãã£ã³ã°ã·ã¹ãã ã®ãµã¼ãã¹ï¼SystemdãUpstartãªã©ï¼ããµã¼ã«ã¹ãã¹ã¼ãã¼ãã¤ã¶ãªã©ã®Pythonãã¼ã¹ã®ã½ãªã¥ã¼ã·ã§ã³ãå«ãå¤ãã®ãªãã·ã§ã³ãå­å¨ãã¾ãã Python 3.5ã¨pypy3ã¨ã®äºææ§ã ã¯ã¤ãã¯ãã¥ã¼ããªã¢ã«ã® `` ini``ãã¡ã¤ã«ããã­ã®ã³ã°ã®è¨­å®ãåé¤ãã¾ãããè¶³å ´ãã­ã®ã³ã°é¢é£ã®ç« ãé¤ããæ©ãããèª¬æã¯é¿ãã¦ãã ããã ãã³ãã¬ã¼ãããéASCIIèä½æ¨©è¨å·ãåé¤ãã¾ãããããã«ãããè¶³å ´ããã­ã¸ã§ã¯ãçæã«å¤±æããåå ã¨ãªãã¾ããã è¶³å ´ã®å¼·å https://github.com/Pylons/pyramid/pull/1641ããã³https://github.com/Pylons/pyramid/pull/2120ãåç§ãã¦ãã ããã Python 3ã®ãã¥ã¼ã§ã­ã¼ã¯ã¼ãã®ã¿ã®å¼æ°ã¨é¢æ°ã¢ããã¼ã·ã§ã³ããµãã¼ããã¦ãã¾ããhttps://github.com/Pylons/pyramid/pull/1556ãåç§ãã¦ãã ããã ï¼classï¼ `ãpyramid.config.Configurator`ã¯ãã¢ã¯ã·ã§ã³ãã³ããããµã¤ã¯ã«ä¸­ã«ä»ã®ã¢ã¯ã·ã§ã³ãå¼ã³åºããããã«ããæ©è½ãæ¡å¼µãã¾ãããããã«ãããä»ã®ã¢ã¯ã·ã§ã³ãå¼ã³åºãæ©è½ããç«¶åæ¤åºãæ¹åããããã«ããããã°ã«ã¼ãåããæ©è½ãªã©ãããå¤ãã®ã­ã¸ãã¯ãã¢ã¯ã·ã§ã³ã«éç½®ã§ãã¾ããã¾ããé©åããã¢ããªã³ã®æ§ç¯ãããã«æ¯æ´ããããã«ãPyramidãä½¿ç¨ããè¨­å®ãã§ã¼ãºãå¬éããææ¸åãã¾ããã https://github.com/Pylons/pyramid/pull/1513ãåç§ãã¦ãã ããã ï¼methï¼ `ãpyramid.config.Configurator.add_notfound_viewï¼ï¼`ã® `` append_slash``å¼æ°ã¯ï¼classï¼ `ãpyramid.interfaces.IResponse`ã¤ã³ã¿ã¼ãã§ã¼ã¹ãå®è£ãã¦ãããã®ãåãå¥ããã¬ã¹ãã³ã¹ã¯ã©ã¹ã¨ãã¦ä½¿ç¨ãã¾ãããã©ã«ãï¼classï¼ `ãpyramid.httpexceptions.HTTPFound`ã®ä»£ããã«ã https://github.com/Pylons/pyramid/pull/1610ãåç§ãã¦ãã ããã ï¼funcï¼ `pyramid.security.remember`ã®` `principal``å¼æ°ã¯` `userid``ã«ååãå¤æ´ããã¾ãããå¼æ°åã¨ãã¦ `` principal``ãä½¿ç¨ãããã¨ã¯å¼ãç¶ãæ©è½ããæ¬¡ã®ããã¤ãã®ãªãªã¼ã¹ã§ã¯å¼ãç¶ãåä½ãã¾ãããéæ¨å¥¨è­¦åãè¡¨ç¤ºããã¾ãã `` pserve``ã³ãã³ãã®ãã¼ã¢ã³åæ©è½ã¨ `` --monitor-restart``ã¯å»æ­¢ããã¾ãããããã«ã¯ã `` --daemon``ã `` --stop-daemon``ã `` -pid-file``ã `` -stop- `` --status``ã `` --user``ã `` --group``ã®åãã©ã°ãããã¾ãã https://github.com/Pylons/pyramid/pull/2120ããã³https://github.com/Pylons/pyramid/pull/2189ããã³https://github.com/Pylons/pyramid/pull/1641ãåç§ãã¦ãã ããã `` pshell``ã¹ã¯ãªããã¯ãã¤ã³ã¿ã¼ããªã¿ãèµ·åããåã«ç°å¢ã«å®ç¾©ããã¦ããå ´åã `` PYTHONSTARTUP``ãã¡ã¤ã«ãèª­ã¿è¾¼ã¿ã¾ãã https://github.com/Pylons/pyramid/pull/1448ãåç§ãã¦ãã ããã å¯è½ã§ããã°ã `` pshell``ã«æ³¨å¥ãããå¤æ°ã¯ããã©ã«ãã® `` strï¼objï¼ ``ã§ã¯ãªãdocstringã§è¡¨ç¤ºããã¾ãã https://github.com/Pylons/pyramid/pull/1929ãåç§ãã¦ãã ããã ãã®è¨äºã§ã¯ãappï¼ `Pyramid`ãã¼ã¸ã§ã³1.6ã®æ°æ©è½ã«ã¤ãã¦èª¬æãã¦ãã¾ãï¼appï¼` Pyramid` 1.5ãã¾ããappï¼ `Pyramid` 1.6ã«è¿½å ããã2ã¤ã®ãã¼ã¸ã§ã³ã¨å»æ­¢äºå®ã¨ã®éã®å¾æ¹äºææ§ã¨ãã½ããã¦ã§ã¢ä¾å­ã®å¤æ´ã¨èãããã­ã¥ã¡ã³ãã®è¿½å ã«ã¤ãã¦ãæ¸ããã¦ãã¾ãã ã¹ã­ã£ãã©ã¼ã«ãã§ä½¿ç¨ããããã®ï¼appï¼ `Pyramid`ã¨ãã®ãã­ã¥ã¡ã³ããè¿ãããã«æ´æ°ãã¾ããã `` starter```ã `` alchemy``ã `` zodb``ãã³ãã¬ã¼ãããã¼ã¸ã§ã³ã¢ããããããã­ã¥ã¡ã³ãã«ãªã³ã¯ããappï¼ `Pyramid`ãè¶³å ´ãçæããããã«ä½¿ç¨ããããã¨ãåæ ãã¾ããã (æ©æ¢°ç¿»è¨³)Pyramid 1.6ã®æ°æ©è½ scaffoldå¼æ°ãªãã§å®è¡ãããã¨ãã« `` pcreate``ã¯ãè¶³ããªããã©ã°ã«é¢ããæå ±ã¨å©ç¨å¯è½ãªè¶³å ´ã®ãªã¹ããåºåããããã«ãªãã¾ããã https://github.com/Pylons/pyramid/pull/1566ããã³https://github.com/Pylons/pyramid/issues/1297ãåç§ãã¦ãã ããã `` pcreate``ã¯ãç¾å¨å­å¨ãããããããã¯ç¾å¨ã®ç°å¢ã§ã¤ã³ãã¼ãå¯è½ãªãã­ã¸ã§ã¯ãåã®å¼æ°ãæå®ãã¦èµ·åããã¨ãç¢ºèªãæ±ãã¾ãã https://github.com/Pylons/pyramid/issues/1357ããã³https://github.com/Pylons/pyramid/pull/1837ãåç§ãã¦ãã ããã æ§æã¨ã©ã¼ã§ `` pserve --reload``ãã¯ã©ãã·ã¥ãããã¨ã¯ãªããªãã¾ããã https://github.com/Pylons/pyramid/pull/2044ãåç§ãã¦ãã ããã `` pserve``ã¯ `` -b``ã¾ãã¯ `` --browser``ãªãã·ã§ã³ãä½¿ã£ã¦ãWebãã©ã¦ã¶ã§ãµã¼ãURLãéãã¾ãã https://github.com/Pylons/pyramid/pull/1533ãåç§ãã¦ãã ããã ï¼ `funcï¼`ãpyramid.renderers.render_to_response` APIãä½¿ç¨ããã¨ãã `` request.response``ã¯ãã¯ãå¤æ´ããã¾ãããã¬ã³ãã©ã¼ã«ã«ã¹ã¿ã ã¬ã¹ãã³ã¹ãªãã¸ã§ã¯ããæä¾ããå ´åã¯ã `` funcï¼ `ãpyramid.renderers.render_to_response`ã«` `response =` `å¼æ°ãæ¸¡ãå¿è¦ãããã¾ããå¤ãæ¸¡ããªãã¨ãç¾å¨ã®ã¬ã¹ãã³ã¹ãã¡ã¯ããªãä½¿ç¨ãã¦ã¬ã¹ãã³ã¹ãªãã¸ã§ã¯ããä½æããã¾ããã»ã¼ãã¹ã¦ã®ã¬ã³ãã©ã¼ã `` request.response``ã¬ã¹ãã³ã¹ãªãã¸ã§ã¯ããå¤æ´ãã¾ãï¼ä¾ãã°ãJSONã¬ã³ãã©ã¼ã¯ `` application / json``ã« `` request.response.content_type``ãè¨­å®ãã¾ãï¼ããããã `` render_to_response``ãå¼ã³åºãã¨ããè¿ãããã¬ã¹ãã³ã¹ãªãã¸ã§ã¯ãã¯ããªã¯ã¨ã¹ãã§å¾ã§ä½¿ç¨ãããã¬ã¹ãã³ã¹ãªãã¸ã§ã¯ãã¨åãã§ããã¨ã¯éãã¾ããã `` render_to_response``ããè¿ãããå¿ç­ãªãã¸ã§ã¯ãã¯ã `` request.response``ã¨æç¤ºçã«ç°ãªã£ã¦ãã¾ããããã¯ã¬ã³ãã©ã¼ã®APIãå¤æ´ãã¾ããã https://github.com/Pylons/pyramid/pull/1563ãåç§ãã¦ãã ããã 