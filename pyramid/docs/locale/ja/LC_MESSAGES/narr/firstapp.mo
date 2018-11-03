Þ    ,      |              Ü  ³   Ý  è       z  ò         
        §  .   Á  l  ð  3  ]
  V     p   è     Y  <   e     ¢  ò   ª  ,    %   Ê    ð  k        p     y  ø     H   ~  
   Ç  0  Ò  µ    §  ¹  O   a  W   ±  ½   	    Ç     ß  å   u     [  L  ø  U  E  .        Ê"     å"     ÿ"  É   #    â#    ú$  ø   &    z'     *  ±  *     É-     è-  !   ï-  R   .  Ï  d.  a  40  w   4     5     ¥5  j   »5     &6  '  -6    U7  *   ê8  r  9     :     ";     3;  $  G;  z   l<     ç<  >  ô<  F  3@  ;  zB  d   ¶D     E    ¢E  H  §F  Û   ðG  H  ÌH  ¥   J  Ý  »J  â  L  ã  |N  !   `Q  %   Q  %   ¨Q     ÎQ  X  ÏR   A view callable is always called with a :term:`request` object.  A request object is a representation of an HTTP request sent to :app:`Pyramid` via the active :term:`WSGI` server. A view callable is required to return a :term:`response` object because a response object has all the information necessary to formulate an actual HTTP response; this object is then converted to text by the :term:`WSGI` server which called Pyramid and it is sent back to the requesting browser.  To return a response, each view callable creates an instance of the :class:`~pyramid.response.Response` class.  In the ``hello_world`` function, a string is passed as the body to the response. Adding Configuration After configuring views and ending configuration, the script creates a WSGI *application* via the :meth:`pyramid.config.Configurator.make_wsgi_app` method. A call to ``make_wsgi_app`` implies that all configuration is finished (meaning all method calls to the configurator, which sets up views and various other configuration settings, have been performed).  The ``make_wsgi_app`` method returns a :term:`WSGI` application object that can be used by any WSGI server to present an application to a requestor. :term:`WSGI` is a protocol that allows servers to talk to Python applications.  We don't discuss :term:`WSGI` in any depth within this book, but you can learn more about it by reading its `documentation <https://wsgi.readthedocs.io/en/latest/>`_. Application Configuration Conclusion Configurator Construction Creating Your First :app:`Pyramid` Application Each time you visit a URL served by the application in a browser, a logging line will be emitted to the console displaying the hostname, the date, the request method and path, and some additional information.  This output is done by the wsgiref server we've used to serve this application.  It logs an "access log" in Apache combined logging format to the console. Finally, we actually serve the application to requestors by starting up a WSGI server.  We happen to use the :mod:`wsgiref` ``make_server`` server maker for this purpose.  We pass in as the first argument ``'0.0.0.0'``, which means "listen on all TCP interfaces".  By default, the HTTP server listens only on the ``127.0.0.1`` interface, which is problematic if you're running the server on a remote system and you wish to access it with a web browser from a local system.  We also specify a TCP port number to listen on, which is 8080, passing it as the second argument.  The final argument is the ``app`` object (a :term:`router`), which is the application we wish to serve.  Finally, we call the server's ``serve_forever`` method, which starts the main loop in which it will wait for requests from the outside world. For more information about :term:`view configuration`, see :ref:`view_config_chapter`. For more information about the API of a :term:`Configurator` object, see :class:`~pyramid.config.Configurator` . Hello World Here's one of the very simplest :app:`Pyramid` applications: Imports In the above script, the following code represents the *configuration* of this simple application. The application is configured using the previously defined imports and function definitions, placed within the confines of an ``if`` statement: In this chapter, we will walk through the creation of a tiny :app:`Pyramid` application.  After we're finished creating the application, we'll explain in more detail how it works. It assumes you already have :app:`Pyramid` installed. If you do not, head over to the :ref:`installing_chapter` section. Let's break this down piece by piece. Like many other Python web frameworks, :app:`Pyramid` uses the :term:`WSGI` protocol to connect an application and a web server together.  The :mod:`wsgiref` server is used in this example as a WSGI server for convenience, as it is shipped within the Python standard library. Now that we have a rudimentary understanding of what the application does, let's examine it piece by piece. On UNIX: On Windows: Our hello world application is one of the simplest possible :app:`Pyramid` applications, configured "imperatively".  We can see that it's configured imperatively because the full power of Python is available to us as we perform configuration tasks. Press ``Ctrl-C`` (or ``Ctrl-Break`` on Windows) to stop the application. References The :app:`Pyramid` application object, in particular, is an instance of a class representing a :app:`Pyramid` :term:`router`.  It has a reference to the :term:`application registry` which resulted from method calls to the configurator used to configure it.  The :term:`router` consults the registry to obey the policy choices made by a single application.  These policy choices were informed by method calls to the :term:`Configurator` made earlier; in our case, the only policy choices made were implied by calls to its ``add_view`` and ``add_route`` methods. The ``if __name__ == '__main__':`` line in the code sample above represents a Python idiom: the code inside this if clause is not invoked unless the script containing this code is run directly from the operating system command line. For example, if the file named ``helloworld.py`` contains the entire script body, the code within the ``if`` statement will only be invoked when ``python helloworld.py`` is executed from the command line. The ``with Configurator() as config:`` line above creates an instance of the :class:`~pyramid.config.Configurator` class using a :term:`context manager`.  The resulting ``config`` object represents an API which the script uses to configure this particular :app:`Pyramid` application.  Methods called on the Configurator will cause registrations to be made in an :term:`application registry` associated with the application. The above ``helloworld.py`` script uses the following set of import statements: The above script, beneath its set of imports, defines a function named ``hello_world``. The first line above calls the :meth:`pyramid.config.Configurator.add_route` method, which registers a :term:`route` to match any URL path that begins with ``/hello/`` followed by a string. The function accepts a single argument (``request``) and it returns an instance of the :class:`pyramid.response.Response` class.  The single argument to the class' constructor is a string computed from parameters matched from the URL. This value becomes the body of the response. The script also imports the :class:`pyramid.response.Response` class for later use.  An instance of this class will be used to create a web response. The script imports the :class:`~pyramid.config.Configurator` class from the :mod:`pyramid.config` module.  An instance of the :class:`~pyramid.config.Configurator` class is later used to configure your :app:`Pyramid` application. The second line registers the ``hello_world`` function as a :term:`view callable` and makes sure that it will be called when the ``hello`` route is matched. This command will not return and nothing will be printed to the console. When port 8080 is visited by a browser on the URL ``/hello/world``, the server will simply serve up the text "Hello world!".  If your application is running on your local system, using `<http://localhost:8080/hello/world>`_ in a browser will show this result. This function is known as a :term:`view callable`.  A view callable accepts a single argument, ``request``.  It is expected to return a :term:`response` object.  A view callable doesn't need to be a function; it can be represented via another type of object, like a class or an instance, but for our purposes here, a function serves us well. Using the ``if`` clause is necessaryâor at least best practiceâbecause code in a Python ``.py`` file may be eventually imported via the Python ``import`` statement by another ``.py`` file.  ``.py`` files that are imported by other ``.py`` files are referred to as *modules*.  By using the ``if __name__ == '__main__':`` idiom, the script above is indicating that it does not want the code within the ``if`` statement to execute if this module is imported from another; the code within the ``if`` block should only be run during a direct script execution. View Callable Declarations WSGI Application Creation WSGI Application Serving When this code is inserted into a Python script named ``helloworld.py`` and executed by a Python interpreter which has the :app:`Pyramid` software installed, an HTTP server is started on TCP port 8080. When this line is invoked, it causes the server to start listening on TCP port 8080.  The server will serve requests forever, or at least until we stop it by killing the process which runs it (usually by pressing ``Ctrl-C`` or ``Ctrl-Break`` in the terminal we used to start it). Project-Id-Version: PROJECT VERSION
Report-Msgid-Bugs-To: EMAIL@ADDRESS
POT-Creation-Date: 2018-11-03 09:37+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 ãã¥ã¼callableã¯å¸¸ã«ï¼termï¼ `request`ãªãã¸ã§ã¯ãã§å¼ã³åºããã¾ãããªã¯ã¨ã¹ããªãã¸ã§ã¯ãã¯ãactiveï¼termï¼ `WSGI`ãµã¼ããä»ãã¦ï¼appï¼` Pyramid`ã«éä¿¡ãããHTTPãªã¯ã¨ã¹ãã®è¡¨ç¾ã§ãã ã¬ã¹ãã³ã¹ãªãã¸ã§ã¯ãã¯å®éã®HTTPã¬ã¹ãã³ã¹ãå®å¼åããã®ã«å¿è¦ãªãã¹ã¦ã®æå ±ãæã£ã¦ãããããviewï¼callableã¯aï¼termï¼ `response`ãªãã¸ã§ã¯ããè¿ãå¿è¦ãããã¾ãããã®ãªãã¸ã§ã¯ãã¯Pyramidãå¼ã³åºããï¼termï¼ `WSGI`ãµã¼ãã«ãã£ã¦ãã­ã¹ãã«å¤æãããè¦æ±åã®ãã©ã¦ã¶ã«è¿éããã¾ããã¬ã¹ãã³ã¹ãè¿ãããã«ãå¼ã³åºãå¯è½ãªåãã¥ã¼ã¯ï¼classï¼ `ãpyramid.response.Response`ã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ãä½æãã¾ãã `` hello_world``é¢æ°ã§ã¯ãæå­åãæ¬æã¨ãã¦å¿ç­ã«æ¸¡ããã¾ãã è¨­å®ã®è¿½å  ãã¥ã¼ã®è¨­å®ã¨è¨­å®ã®çµäºå¾ãã¹ã¯ãªããã¯ï¼methï¼ `pyramid.config.Configurator.make_wsgi_app`ã¡ã½ãããä½¿ç¨ãã¦WSGI *ã¢ããªã±ã¼ã·ã§ã³*ãä½æãã¾ãã `` make_wsgi_app``ãå¼ã³åºããã¨ã¯ããã¹ã¦ã®è¨­å®ãçµäºãããã¨ãæå³ãã¾ãï¼ãã¥ã¼ããã®ä»ã®è¨­å®ãè¡ãã³ã³ãã£ã®ã¥ã¬ã¼ã¿ã¸ã®ãã¹ã¦ã®ã¡ã½ããã³ã¼ã«ãå®è¡ããããã¨ãæå³ãã¾ãï¼ã `` make_wsgi_app``ã¡ã½ããã¯ï¼termï¼ `WSGI`ã¢ããªã±ã¼ã·ã§ã³ãªãã¸ã§ã¯ããè¿ãã¾ããããã¯ãä»»æã®WSGIãµã¼ãããªã¯ã¨ã¹ã¿ã«ã¢ããªã±ã¼ã·ã§ã³ãæç¤ºããããã«ä½¿ç¨ã§ãã¾ãã ï¼termï¼ `WSGI`ã¯ãµã¼ããPythonã¢ããªã±ã¼ã·ã§ã³ã¨éä¿¡ããããã®ãã­ãã³ã«ã§ããç§ãã¡ã¯è­°è«ãã¾ããï¼ç¨èªï¼ `WSGI`ã¯ãã®æ¬ã®ä¸­ã§æ·±ãèãã¦ãã¾ããã <https://wsgi.readthedocs.io/en/latest/> `_ã ã¢ããªã±ã¼ã·ã§ã³æ§æ çµè« ã³ã³ãã£ã°ã¬ã¼ã¿ã®æ§ç¯ (æ©æ¢°ç¿»è¨³) ããªãã®æåã®ä½æ :app:`Pyramid` ã¢ããªã±ã¼ã·ã§ã³ ãã©ã¦ã¶ã§ã¢ããªã±ã¼ã·ã§ã³ãæä¾ãã¦ããURLã«ã¢ã¯ã»ã¹ãããã³ã«ããã¹ãåãæ¥ä»ãè¦æ±ã®æ¹æ³ã¨ãã¹ãããã³ãã®ä»ã®æå ±ãè¡¨ç¤ºããã¾ãããã®åºåã¯ããã®ã¢ããªã±ã¼ã·ã§ã³ãæä¾ããããã«ä½¿ç¨ããwsgirefãµã¼ãã¼ã«ãã£ã¦è¡ããã¾ããããã¯ãã³ã³ã½ã¼ã«ã«ã­ã°è¨é²å½¢å¼ãçµã¿åãããApacheã®\ &quot;ã¢ã¯ã»ã¹ã­ã°\&quot;ãè¨é²ãã¾ãã æå¾ã«ãå®éã«ã¯WSGIãµã¼ãã¼ãèµ·åãã¦ãªã¯ã¨ã¹ã¿ã«ã¢ããªã±ã¼ã·ã§ã³ãæä¾ãã¾ãããã®ç®çã®ããã«ãï¼modï¼ `wsgiref`` `make_server``ãµã¼ãã¡ã¼ã«ã¼ãä½¿ç¨ãã¾ããæãã¯æåã®å¼æ° `` &#39;0.0.0.0&#39;``ã¨ãã¦æ¸¡ãã¾ããããã¯\ &quot;ãã¹ã¦ã®TCPã¤ã³ã¿ãã§ã¼ã¹ã§å¾ã¡åãã\&quot;ãæå³ãã¾ããããã©ã«ãã§ã¯ãHTTPãµã¼ãã¼ã¯ `` 127.0.0.1``ã¤ã³ã¿ã¼ãã§ã¼ã¹ã®ã¿ãlistenãã¾ããããã¯ããªã¢ã¼ãã·ã¹ãã ä¸ã§ãµã¼ãã¼ãå®è¡ãã¦ãã¦ãã­ã¼ã«ã«ã·ã¹ãã ããWebãã©ã¦ã¶ã¼ã§ã¢ã¯ã»ã¹ãããå ´åã«åé¡ã«ãªãã¾ããã¾ããå¾æ©ããTCPãã¼ãçªå·ã8080ã«æå®ãã2çªç®ã®å¼æ°ã¨ãã¦æ¸¡ãã¾ããæå¾ã®å¼æ°ã¯ `` app``ãªãã¸ã§ã¯ãï¼aï¼termï¼ `router`ï¼ã§ããããã¯ç§ãã¡ãæä¾ãããã¢ããªã±ã¼ã·ã§ã³ã§ããæå¾ã«ããµã¼ãã¼ã® `` serve_forever``ã¡ã½ãããå¼ã³åºãã¦ãã¡ã¤ã³ã«ã¼ããéå§ãã¾ããã¡ã¤ã³ã«ã¼ãã§ã¯ãå¤é¨ããã®è¦æ±ãå¾æ©ãã¾ãã ï¼termï¼ `view configuration`ã®è©³ç´°ã«ã¤ãã¦ã¯ãï¼refï¼` view_config_chapter`ãåç§ãã¦ãã ããã aï¼termï¼ `Configurator`ãªãã¸ã§ã¯ãã®APIã®è©³ç´°ã«ã¤ãã¦ã¯ãï¼classï¼`ãpyramid.config.Configurator`ãåç§ãã¦ãã ããã ããã«ã¡ã¯ä¸ç éå¸¸ã«ã·ã³ãã«ãªã¢ããªã±ã¼ã·ã§ã³ã®ã²ã¨ã¤ï¼appï¼ `Pyramid`ã¢ããªã±ã¼ã·ã§ã³ï¼ è¼¸å¥ ä¸è¨ã®ã¹ã¯ãªããã§ã¯ãæ¬¡ã®ã³ã¼ãã¯ãã®åç´ãªã¢ããªã±ã¼ã·ã§ã³ã®*è¨­å®*ãè¡¨ãã¦ãã¾ããã¢ããªã±ã¼ã·ã§ã³ã¯ãå®ç¾©æ¸ã¿ã®ã¤ã³ãã¼ãã¨é¢æ°å®ç¾©ãä½¿ç¨ãã¦è¨­å®ããã `` if``ã¹ãã¼ãã¡ã³ãã®ç¯å²åã«éç½®ããã¾ãï¼ ãã®ç« ã§ã¯ãå°ããªï¼appï¼ `Pyramid`ã¢ããªã±ã¼ã·ã§ã³ã®ä½æã«ã¤ãã¦èª¬æãã¾ããã¢ããªã±ã¼ã·ã§ã³ã®ä½æãå®äºãããããã®åä½ãããè©³ããèª¬æãã¾ããæ¢ã«ï¼appï¼ `Pyramid`ãã¤ã³ã¹ãã¼ã«ããã¦ãããã¨ãåæã¨ãã¦ãã¾ããããããã§ãªããã°ãï¼refï¼ `installing_chapter`ã»ã¯ã·ã§ã³ã«åããã¾ãã ãããä¸æãã¤å£ãã¾ãããã ä»ã®å¤ãã®Python Webãã¬ã¼ã ã¯ã¼ã¯ã¨åæ§ã«ãï¼appï¼ `Pyramid`ã¯ï¼termï¼` WSGI`ãã­ãã³ã«ãä½¿ç¨ãã¦ãã¢ããªã±ã¼ã·ã§ã³ã¨Webãµã¼ãã¼ãä¸ç·ã«æ¥ç¶ãã¾ãã ï¼modï¼ `wsgiref`ãµã¼ãã¯ããã®ä¾ã§ã¯ãPythonæ¨æºã©ã¤ãã©ãªã«å«ã¾ãã¦ãããããä¾¿å®ä¸WSGIãµã¼ãã¨ãã¦ä½¿ç¨ãã¦ãã¾ãã ã¢ããªã±ã¼ã·ã§ã³ãä½ããã¦ããã®ãã«ã¤ãã¦ã®åæ­©çãªçè§£ããã£ãã®ã§ããããå°ããã¤èª¿ã¹ã¦ã¿ã¾ãããã UNIXã®å ´åï¼ Windowsã®å ´åï¼ ç§ãã¡ã®hello worldã¢ããªã±ã¼ã·ã§ã³ã¯ãå¯è½ãªéãã·ã³ãã«ãªappï¼ `Pyramid`ã¢ããªã±ã¼ã·ã§ã³ã®1ã¤ã§ããããã¯ãè¨­å®ã¿ã¹ã¯ãå®è¡ããã¨ãã«ãPythonã®å®å¨æ©è½ãå©ç¨ã§ãããããå¿é ã®è¨­å®ã§ãããã¨ããããã¾ãã ã¢ããªã±ã¼ã·ã§ã³ãåæ­¢ããã«ã¯ã `` Ctrl-C``ï¼Windowsã§ã¯ `` Ctrl-Break``ï¼ãæ¼ãã¦ãã ããã åèæç® ï¼appï¼ `Pyramid`ã¢ããªã±ã¼ã·ã§ã³ãªãã¸ã§ã¯ãã¯ãç¹ã«ï¼appï¼` Pyramid`ï¼termï¼ `router`ãè¡¨ãã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ã§ããããã«ã¯ï¼termï¼ `ã¢ããªã±ã¼ã·ã§ã³ã¬ã¸ã¹ããª &#39;ã¸ã®åç§ãããã¾ããããã¯ããããè¨­å®ããããã«ä½¿ç¨ãããã³ã³ãã£ã®ã¥ã¬ã¼ã¿ã¸ã®ã¡ã½ããå¼ã³åºãã«èµ·å ãã¾ãã ï¼termï¼ `router`ã¯ãåä¸ã®ã¢ããªã±ã¼ã·ã§ã³ã«ãã£ã¦è¡ãããããªã·ã¼é¸æã«å¾ãããã«ã¬ã¸ã¹ããªã«åãåããã¾ãããããã®ããªã·ã¼é¸æã¯ãï¼termï¼ `Configurator`ã¸ã®ã¡ã½ããå¼ã³åºãã«ãã£ã¦éç¥ããã¾ãããç§ãã¡ã®å ´åãå¯ä¸ã®ããªã·ã¼é¸æã¯ã `` add_view``ã¨ `` add_route``ã¡ã½ããã®å¼ã³åºãã«ãã£ã¦æç¤ºããã¾ããã ä¸ã®ã³ã¼ããµã³ãã«ã® `` if __name__ == &#39;__main __&#39;ï¼ ``è¡ã¯ãPythonã¤ãã£ãªã ãè¡¨ãã¾ãããã®ifç¯åã®ã³ã¼ãã¯ããã®ã³ã¼ããå«ãã¹ã¯ãªããããªãã¬ã¼ãã£ã³ã°ã·ã¹ãã ã®ã³ãã³ãã©ã¤ã³ããç´æ¥å®è¡ãããªãéãå¼ã³åºããã¾ããããã¨ãã°ã `` helloworld.py``ã¨ããååã®ãã¡ã¤ã«ã«ã¹ã¯ãªããæ¬ä½å¨ä½ãå«ã¾ãã¦ããå ´åã `` if``æåã®ã³ã¼ãã¯ `` python helloworld.py``ãã³ãã³ãã©ã¤ã³ããå®è¡ãããã¨ãã«ã®ã¿å¼ã³åºããã¾ãã ä¸è¨ã® `` Configuratorï¼ï¼as configï¼ ``è¡ã¯ãï¼termï¼ `context manager`ãä½¿ç¨ãã¦ï¼classï¼`ãpyramid.config.Configurator`ã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ãä½æãã¾ããçæããã `` config``ãªãã¸ã§ã¯ãã¯ããã®ç¹å®ã®ï¼appï¼ `Pyramid`ã¢ããªã±ã¼ã·ã§ã³ãè¨­å®ããããã«ã¹ã¯ãªãããä½¿ç¨ããAPIãè¡¨ãã¾ããã³ã³ãã£ã°ã¬ã¼ã¿ã§å¼ã³åºãããã¡ã½ããã¯ãã¢ããªã±ã¼ã·ã§ã³ã«é¢é£ä»ããããï¼termï¼ `ã¢ããªã±ã¼ã·ã§ã³ã¬ã¸ã¹ããª &#39;ã§ç»é²ãè¡ãã¾ãã ä¸è¨ã® `` helloworld.py``ã¹ã¯ãªããã¯ãä»¥ä¸ã®importæã®ã»ãããä½¿ç¨ãã¾ãï¼ ä¸è¨ã®ã¹ã¯ãªããã¯ãã¤ã³ãã¼ãã»ããã®ä¸ã«ã `` hello_world``ã¨ããååã®é¢æ°ãå®ç¾©ãã¦ãã¾ãã ä¸è¨ã®æåã®è¡ã¯ï¼methï¼ `pyramid.config.Configurator.add_route`ã¡ã½ãããå¼ã³åºãã¾ãããã®ã¡ã½ããã¯ã` `/ hello /` `ã§å§ã¾ãããã®å¾ã«æå­åãç¶ãURLãã¹ã«ãããããï¼termï¼` route`ãç»é²ãã¾ãã é¢æ°ã¯åä¸ã®å¼æ°ï¼ `` request``ï¼ãåãåããï¼classï¼ `pyramid.response.Response`ã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ãè¿ãã¾ããã¯ã©ã¹ã®ã³ã³ã¹ãã©ã¯ã¿ã¸ã®åä¸ã®å¼æ°ã¯ãURLããä¸è´ãããã©ã¡ã¼ã¿ããè¨ç®ãããæå­åã§ãããã®å¤ã¯å¿ç­ã®æ¬ä½ã«ãªãã¾ãã ãã®ã¹ã¯ãªããã¯ãå¾ã§ä½¿ãããã«ï¼classï¼ `pyramid.response.Response`ã¯ã©ã¹ãã¤ã³ãã¼ããã¾ãããã®ã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ã¯ãWebã¬ã¹ãã³ã¹ã®ä½æã«ä½¿ç¨ããã¾ãã ãã®ã¹ã¯ãªããã¯ãï¼modï¼ `pyramid.config`ã¢ã¸ã¥ã¼ã«ããï¼classï¼`ãpyramid.config.Configurator`ã¯ã©ã¹ãã¤ã³ãã¼ããã¾ãã ï¼classï¼ `ãpyramid.config.Configurator`ã¯ã©ã¹ã®ã¤ã³ã¹ã¿ã³ã¹ã¯ãå¾ã§ï¼appï¼` Pyramid`ã¢ããªã±ã¼ã·ã§ã³ãè¨­å®ããããã«ä½¿ããã¾ãã 2è¡ç®ã¯ `` hello_world``é¢æ°ãï¼termï¼ `view callable`ã¨ãã¦ç»é²ãã` `hello``ã«ã¼ããä¸è´ããã¨ãã«å¼ã³åºãããããã«ãã¾ãã ãã®ã³ãã³ãã¯æ»ãããã³ã³ã½ã¼ã«ã«ä½ãè¡¨ç¤ºããã¾ããããã¼ã8080ããã©ã¦ã¶ã¼ã«ãã£ã¦ `` / hello / world``ã®URLã«ã¢ã¯ã»ã¹ãããã¨ããµã¼ãã¼ã¯åç´ã«\ &quot;Hello worldï¼\&quot;ã¨ãããã­ã¹ããæä¾ãã¾ããããªãã®ã¢ããªã±ã¼ã·ã§ã³ãããªãã®ã­ã¼ã«ã«ã·ã¹ãã ã§å®è¡ããã¦ããå ´åã¯ã <http://localhost:8080/hello/world> `_ã¯ãã©ã¦ã¶ã§ãã®çµæãè¡¨ç¤ºãã¾ãã ãã®é¢æ°ã¯aï¼termï¼ `view callable`ã¨å¼ã°ãã¾ãããã¥ã¼å¼ã³åºãå¯è½é¢æ°ã¯ãåä¸ã®å¼æ° `` request``ãåãåãã¾ãã ï¼termï¼ `response`ãªãã¸ã§ã¯ããè¿ããã¨ãæå¾ããã¾ãããã¥ã¼å¼ã³åºãå¯è½ã¯é¢æ°ã§ããå¿è¦ã¯ããã¾ãããã¯ã©ã¹ãã¤ã³ã¹ã¿ã³ã¹ã®ãããªå¥ã®ã¿ã¤ãã®ãªãã¸ã§ã¯ããä»ãã¦è¡¨ç¾ãããã¨ãã§ãã¾ãããããã§ã¯é¢æ°ããã¾ãæ©è½ãã¾ãã Pythonã® `` .py``ãã¡ã¤ã«ã®ã³ã¼ãã¯ãPythonã® `` import``æãä»ãã¦å¥ã® `` .py``ã§ã¤ã³ãã¼ããããå¯è½æ§ãããããã `` if``ç¯ãä½¿ç¨ããå¿è¦ãããã¾ãããã¡ã¤ã«ãä»ã® `` .py``ãã¡ã¤ã«ã«ãã£ã¦ã¤ã³ãã¼ãããã `` .py``ãã¡ã¤ã«ã¯ã* modules *ã¨å¼ã°ãã¾ããä¸è¨ã®ã¹ã¯ãªããã¯ã `` if __name__ == &#39;__main __&#39;ï¼ ``ã¤ãã£ãªã ãä½¿ç¨ãããã¨ã«ãã£ã¦ããã®ã¢ã¸ã¥ã¼ã«ãå¥ã®ã¢ã¸ã¥ã¼ã«ããã¤ã³ãã¼ããããå ´åã« `` if``æåã®ã³ã¼ããå®è¡ããããªããã¨ãç¤ºãã¦ãã¾ãã `` if``ãã­ãã¯åã®ã³ã¼ãã¯ç´æ¥ã¹ã¯ãªããã®å®è¡ä¸­ã«ã®ã¿å®è¡ãããã¹ãã§ãã ã³ã¼ã«å¯è½ãªå®£è¨ã®è¡¨ç¤º WSGIã¢ããªã±ã¼ã·ã§ã³ã®ä½æ WSGIã¢ããªã±ã¼ã·ã§ã³ã®æä¾ ãã®ã³ã¼ãã `` helloworld.py``ã¨ããååã®Pythonã¹ã¯ãªããã«æ¿å¥ããï¼appï¼ `Pyramid`ã½ããã¦ã§ã¢ãã¤ã³ã¹ãã¼ã«ãããPythonã¤ã³ã¿ããªã¿ã§å®è¡ããã¨ãTCPãã¼ã8080ã§HTTPãµã¼ããèµ·åãã¾ãã ãã®è¡ãå¼ã³åºãããã¨ããµã¼ãã¯TCPãã¼ã8080ã§ãªãã¹ã³ãéå§ãã¾ãããµã¼ãã¯è¦æ±ãæ°¸é ã«ããããã¯å°ãªãã¨ãå®è¡ãããã­ã»ã¹ãå¼·å¶çµäºããã¾ã§ï¼éå¸¸ã¯ `` Ctrl-C``ãæ¼ãã¦ï¼ãããèµ·åããããã«ä½¿ç¨ããç«¯æ«ã§ã¯ `` Ctrl-Break``ãå®è¡ãã¾ãï¼ã 