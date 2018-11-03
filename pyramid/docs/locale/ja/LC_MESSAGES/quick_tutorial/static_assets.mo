Þ          Ì               |  *   }  Z   ¨  <        @     I  7   V       
   ¡  ¬   ¬  B   Y  .     "   Ë     î  _   ô  
  T  =   _  S     T   ñ  ^   F  Ñ   ¥  #  w      v   %
  a   
  M   þ
     L  ,   ]  C        Î     ë    þ  ]     N   t  D   Ã       s     K    X   Ö  n   /  s     l     E    ¯  Å   13: CSS/JS/Images Files With Static Assets :ref:`assets_chapter`, :ref:`preventing_http_caching`, and :ref:`influencing_http_caching` Add a CSS file at ``static_assets/tutorial/static/app.css``: Analysis Extra credit First we copy the results of the ``view_classes`` step: Now run the tests: Objectives Of course the Web is more than just markup. You need static assets: CSS, JS, and images. Let's point our web app at a directory where Pyramid will serve some static assets. Open http://localhost:6543/ in your browser and note the new font. Publish a directory of static assets at a URL. Run your Pyramid application with: Steps There is also a ``request.static_path`` API.  How does this differ from ``request.static_url``? This matches the ``path='tutorial:static'`` in our ``config.add_static_view`` registration. By using ``request.static_url`` to generate the full URL to the static assets, you both ensure you stay in sync with the configuration and gain refactoring flexibility later. Use Pyramid to help generate URLs to files in that directory. We add a call ``config.add_static_view`` in ``static_assets/tutorial/__init__.py``: We add a functional test that asserts that the newly added static file is delivered: We can add a CSS link in the ``<head>`` of our template at ``static_assets/tutorial/home.pt``: We changed our WSGI application to map requests under http://localhost:6543/static/ to files and directories inside a ``static`` directory inside our ``tutorial`` package. This directory contained ``app.css``. We linked to the CSS in our template. We could have hard-coded this link to ``/static/app.css``. But what if the site is later moved under ``/somesite/static/``? Or perhaps the web developer changes the arrangement on disk? Pyramid gives a helper that provides flexibility on URL generation: Project-Id-Version: The Pyramid Web Framework 1.9.2
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
 13: ã¹ã¿ãã£ãã¯ã¢ã»ãããä½¿ç¨ããCSS/JS/ç»åãã¡ã¤ã«(13: CSS/JS/Images Files With Static Assets) ":ref:`assets_chapter`, :ref:`preventing_http_caching`, ããã¦ :ref:`influencing_http_caching` CSSãã¡ã¤ã« ``static_assets/tutorial/static/app.css`` ãè¿½å ãã¾ã: åæ(Analysis) ã¨ã¯ã¹ãã©ã¯ã¬ã¸ãã(Extra credit) æåã« ``view_classes`` ã®æé ã®çµæãã³ãã¼ãã¾ã: ãã¹ããå®è¡ãã¾ã: ç®ç(Objectives) ãã¡ããWebã¯åã«ãã¼ã¯ã¢ããä»¥ä¸ã®ãã®ã§ããCSSãJSãç»åãªã©ã®éçã¢ã»ãããå¿è¦ã§ããPyramidãããã¤ãã®éçãªã¢ã»ãããæä¾ãããã£ã¬ã¯ããªã«ã¤ãã¦webã¢ããªã±ã¼ã·ã§ã³ãè¨­å®ãã¦ã¿ã¾ãããã ãã©ã¦ã¶ã§ http://localhost:6543/ ãéããæ°ãããã©ã³ããæ³¨æãã¾ãã éçã¢ã»ããã®ãã£ã¬ã¯ããªãURLã«ãããªãã·ã¥ãã¾ãã Pyramidã¢ããªã±ã¼ã·ã§ã³ãä»¥ä¸ã®ããã«å®è¡ãã¾ã: æé (Steps) ``request.static_path`` API ãããã¾ããããã¯ ``request.static_url`` ã¨ã©ã®ããã«éãã¾ããï¼ ããã¯ ``config.add_static_view`` ã®ç»é²ã§ ``path='tutorial:static'`` ã«ä¸è´ãã¾ãã  ``request.static_url``  ãä½¿ç¨ãã¦éçã¢ã»ããã®å®å¨ãªURLãçæãããã¨ã«ãããã³ã³ãã£ã°ã¬ã¼ã·ã§ã³ã¨ã®åæãç¶­æãã¾ãããã®å¾ã«ãªãã¡ã¯ã¿ãªã³ã°ã®æè»æ§ãå¾ã¾ãã Pyramidãä½¿ç¨ãã¦ãã£ã¬ã¯ããªåã®ãã¡ã¤ã«ã¸ã®URLãçæãã¾ãã ``static_assets/tutorial/__init__.py`` ã« ``config.add_static_view`` ã¨ããå¼ã³åºããè¿½å ãã¾ã: æ°ããè¿½å ãããéçãã¡ã¤ã«ãéä¿¡ããããã¨ãç¢ºèªããæ©è½ãã¹ããè¿½å ãã¾ã: ``static_assets/tutorial/home.pt`` ã®ãã³ãã¬ã¼ãã® ``<head>`` ã«CSSãªã³ã¯ãè¿½å ã§ãã¾ã: http://localhost:6543/static/ ã«ãããªã¯ã¨ã¹ããã``tutorial`` ããã±ã¼ã¸åã® ``static`` ãã£ã¬ã¯ããªåã®ãã¡ã¤ã«ã¨ãã£ã¬ã¯ããªã«ãããã³ã°ããããã«ãWSGIã¢ããªã±ã¼ã·ã§ã³ãå¤æ´ãã¾ããã ãã®ãã£ã¬ã¯ããªã«ã¯ ``app.css`` ãå«ã¾ãã¦ãã¾ããã ãã³ãã¬ã¼ãã®CSSã«ãªã³ã¯ãã¾ããã ãã®ãªã³ã¯ã ``/static/app.css`` ã«ãã¼ãã³ã¼ãã£ã³ã°ãã¾ããã ããããµã¤ããå¾ã«ã``/somesite/static/``ãã®ä¸ã«ç§»åãããã¨ã©ããªãã¾ããï¼ ãããã¯Webéçºèããã£ã¹ã¯ä¸ã®ã¢ã¬ã³ã¸ãå¤æ´ãããã©ãããã®ã§ããããï¼ Pyramidã¯URLçæã«æè»æ§ãæä¾ãããã«ãã¼ãæä¾ãã¾ãï¼ 