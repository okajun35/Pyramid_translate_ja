Þ          ô               Ì  '   Í  ?   õ     5  
   >  +   I  l   u  É   â     ¬  O   ¹  7   	     A  ·   _  ï     E        M  
   `  c   k  <   Ï  |    "     A   ¬     î  ;   ô  @   0	     q	     
    
  [     ?   {     »     Ì  9   ß         ±  ,   É  o   ö  ?   f  3   ¦  ç   Ú  _  Â  k   "          «  z   ¾  I   9  È    D   L  L        Þ  E   ì  C   2  ¼   v  Á   3   10: Handling Web Requests and Responses :ref:`webob_chapter`, :ref:`generate redirects <http_redirect>` Analysis Background Change information in the response headers. Could we also ``raise HTTPFound(location='/plain')`` instead of returning it?  If so, what's the difference? Developing for the web means processing web requests. As this is a critical part of a web application, web developers need a robust, mature set of software for web requests and returning web responses. Extra credit Finally, we set the response's content type and body, then return the response. First we copy the results of the ``view_classes`` step: Grab data out of the request. In this Pyramid view, we get the URL being visited from ``request.url``. Also, if you visited http://localhost:6543/plain?name=alice, the name is included in the body of the response: In this view class, we have two routes and two views, with the first leading to the second by an HTTP redirect. Pyramid can :ref:`generate redirects <http_redirect>` by returning a special object from a view or raising a special exception. Learn the background on Pyramid's choices for requests and responses. Now run the tests: Objectives Open http://localhost:6543/ in your browser. You will be redirected to http://localhost:6543/plain. Open http://localhost:6543/plain?name=alice in your browser. Pyramid has always fit nicely into the existing world of Python web development (virtual environments, packaging, cookiecutters, first to embrace Python 3, and so on). Pyramid turned to the well-regarded :term:`WebOb` Python library for request and response handling. In our example above, Pyramid hands ``hello_world`` a ``request`` that is :ref:`based on WebOb <webob_chapter>`. Run your Pyramid application with: Simplify the routes in ``request_response/tutorial/__init__.py``: Steps Update the tests in ``request_response/tutorial/tests.py``: We only need one view in ``request_response/tutorial/views.py``: We updated the unit and functional tests to prove that our code does the redirection, but also handles sending and not sending ``/plain?name``. Web applications handle incoming requests and return outgoing responses. Pyramid makes working with requests and responses convenient and reliable. Project-Id-Version: The Pyramid Web Framework 1.9.2
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
 10ï¼Webãªã¯ã¨ã¹ãã¨ã¬ã¹ãã³ã¹ã®å¦ç(10: Handling Web Requests and Responses) :ref:`webob_chapter`, :ref:`generate redirects <http_redirect>` åæ(Analysis) èæ¯(Background) ã¬ã¹ãã³ã¹ãããã¼ã®æå ±ãå¤æ´ãã¾ãã ã«ã¼ãã£ã³ã°ãè¿ãã®ã§ã¯ãªã ``raise HTTPFound(location='/plain')`` ã§ãã§ãã¾ããï¼ãããããªããéãã¯ä½ã§ããï¼ Webéçºã¨ã¯Webã®ãªã¯ã¨ã¹ããå¦çãããã¨ãã§ããããã¯Webã¢ããªã±ã¼ã·ã§ã³ã®éè¦ãªé¨åã§ãããããWebéçºèã¯Webãªã¯ã¨ã¹ãã¨Webã¬ã¹ãã³ã¹ãè¿ãããã®å ç¢ã§æçããã½ããã¦ã§ã¢ã»ãããå¿è¦ã§ãã ã¨ã¯ã¹ãã©ã¯ã¬ã¸ãã(Extra credit) æå¾ã«ã¬ã¹ãã³ã¹ã®ã³ã³ãã³ãã¿ã¤ãã¨ããã£ãè¨­å®ãã¦ã¬ã¹ãã³ã¹ãè¿ãã¾ãã æåã«ã``view_classes`` ã§ã®çµæãã³ãã¼ãã¾ã: ãªã¯ã¨ã¹ããããã¼ã¿ãåå¾ãã¾ãã ä»åã®Pyramidã®ãã¥ã¼ã¯ã``request.url``ãããã¢ã¯ã»ã¹ããURLãåå¾ãã¾ããã¾ããhttp://localhost:6543/plain?name=alice ã«ã¢ã¯ã»ã¹ããå ´åã¯ãnameã¯ã¬ã¹ãã³ã¹ããã£ã«å«ã¾ãã¾ã: ä»åã®ãã¥ã¼ã¯ã©ã¹ã§ã¯2ã¤ã®ã«ã¼ãã¨2ã¤ã®ãã¥ã¼ããããæåã®æ¹ã¯HTTPãªãã¤ã¬ã¯ãã§2çªç®ã®ãã¥ã¼ã«ã¤ãªããã¾ããPyramidã¯ãã¥ã¼ããç¹å¥ãªãªãã¸ã§ã¯ããè¿ãããç¹å¥ãªä¾å¤ãçºçããããã¨ã«ãã£ã¦ã :ref:`generate redirects <http_redirect>` ãçæã§ãã¾ãã Pyramidnã®ãªã¯ã¨ã¹ããªã¯ã¨ã¹ãã¨ã¬ã¹ãã³ã¹ã®é¸æã«ã¤ãã¦ã®èæ¯ãå­¦ã³ã¾ãã ãã¹ããå®è¡ãã¾ã: ç®ç(Objectives) ãã©ã¦ã¶ã§ http://localhost:6543/ ãéãã¾ãã http://localhost:6543/plain ã«ãªãã¤ã¬ã¯ãããã¾ãã ãã©ã¦ã¶ã§ http://localhost:6543/plain?name=alice ãéãã¾ãã Pyramidã¯Pythonã®Webéçºã®ä¸çï¼ä»®æ³ç°å¢ãããã±ã¼ã¸ã¸ã³ã°ãCookiecutterãPython3ç³»ãæåã«æ¡ç¨ãããªã©ï¼ã«ä¸æã«é©åãã¦ãã¾ããPyramidã¯ãªã¯ã¨ã¹ãã¨ã¬ã¹ãã³ã¹ã®å¦çã®ããã«è©ä¾¡ãããPythonã©ã¤ãã©ãªã® :term:`WebOb` ã«ç®ãåãã¾ãããååã®ä¾ã® ``request`` ã® ``hello_world``ãã«ã¤ãã¦ã¯Pyramidã® :ref:`based on WebOb <webob_chapter>` ã«åºã¥ãã¾ãã Pyramidã¢ããªã±ã¼ã·ã§ã³ãä»¥ä¸ã®ããã«å®è¡ãã¾ã: ``request_response/tutorial/__init__.py`` ã§ã«ã¼ããç°¡ç¥åãã¾ã: æé (Steps) `request_response/tutorial/tests.py`` ã®ãã¹ããæ´æ°ãã¾ã: ``request_response/tutorial/views.py`` ã®ãã¥ã¼ãå¿è¦ã§ã: ã¦ãããã¨æ©è½ãã¹ããæ´æ°ãã¦ãã³ã¼ãããªãã¤ã¬ã¯ããè¡ããã¨ãè¨¼æãã¾ãããã /plain?name ã¯éä¿¡ãã/ãããªãã£ãã®ã§ããããï¼ Webã¢ããªã±ã¼ã·ã§ã³ã¯åä¿¡ãããªã¯ã¨ã¹ããå¦çãã¦ã¬ã¹ãã³ã¹ãè¿ãã¾ããPyramidã¯ãªã¯ã¨ã¹ãã¨ã¬ã¹ãã³ã¹ãä¾¿å©ã§ä¿¡é ¼ã§ãããã®ã«ãã¾ã 