Þ    >                    ü     ý  Æ     «   Û      ì     =       A  H   Z	  *   £	  X  Î	  ù   '  `  !  r    y  õ    o     û       i   ¨  U     h   h     Ñ  ò   Ý  *   Ð  (   û  <   $     a  G   å  b   -  +     C   ¼       |    %   	  7   /  ­   g  B     n   X  /   Ç    ÷          "     6     I     Y     q       
             ª     ·     Ã  q   Ì     >     O  
   X  
   c     n     }          ©     ¾    Ê  %   Q     w   Ó   !  í  f"  9  T$  ]   %    ì%  f   y'  ?   à'  è   (    	*    +  ´  ª-  Ã  _/  ó  #1     3  Å   43     ú3     4  ¯   5     Í5  0  ã5  7   7  >   L7  ^   7  Û   ê7  m   Æ8     49  3   Æ9  _   ú9  ü  Z:  Ò  W<  0   *>  R   [>  ý   ®>  W   ¬?     @  O   @    é@     B     B     ¨B     ¼B     ÍB     æB     ÷B     
C     C     0C     >C     KC  °   WC     D     D     #D     0D     <D     UD     kD     D     D   :mod:`pyramid.session` A callable which takes a signed and serialized data structure in bytes and a secret and returns the original data structure if the signature is valid. Default: ``signed_deserialize`` (using pickle). A callable which takes more or less arbitrary Python data structure and a secret and returns a signed serialization in bytes. Default: ``signed_serialize`` (using pickle). A good rule of thumb: if you want auto-expired cookies based on inactivity: set the ``timeout`` value to 1200 (20 mins) and set the ``reissue_time`` value to perhaps a tenth of the ``timeout`` value (120 or 2 mins).  It's nonsensical to set the ``timeout`` value lower than the ``reissue_time`` value, as the ticket will never be reissued. However, such a configuration is not explicitly prevented. A namespace to avoid collisions between different uses of a shared secret. Reusing a secret for different parts of an application is strongly discouraged (see :ref:`admonishment_against_secret_sharing`). Default: ``'pyramid.session.'``. A number of seconds of inactivity before a session times out. A number of seconds of inactivity before a session times out. If ``None`` then the cookie never expires. This lifetime only applies to the *value* within the cookie. Meaning that if the cookie expires due to a lower ``max_age``, then this setting has no effect. Default: ``1200``. A serializer that uses the pickle protocol to dump Python data to bytes. A string which is used to sign the cookie. A string which is used to sign the cookie. The secret should be at least as long as the block size of the selected hash algorithm. For ``sha512`` this would mean a 512 bit (64 character) secret.  It should be unique within the set of secret values provided to Pyramid for its various subsystems (see :ref:`admonishment_against_secret_sharing`). An object with two methods: ``loads`` and ``dumps``.  The ``loads`` method should accept bytes and return a Python object.  The ``dumps`` method should accept a Python object and return bytes.  A ``ValueError`` should be raised for malformed inputs. An object with two methods: ``loads`` and ``dumps``.  The ``loads`` method should accept bytes and return a Python object.  The ``dumps`` method should accept a Python object and return bytes.  A ``ValueError`` should be raised for malformed inputs.  If a serializer is not passed, the :class:`pyramid.session.PickleSerializer` serializer will be used. Configure a :term:`session factory` which will provide cookie-based sessions.  The return value of this function is a :term:`session factory`, which may be provided as the ``session_factory`` argument of a :class:`pyramid.config.Configurator` constructor, or used as the ``session_factory`` argument of the :meth:`pyramid.config.Configurator.set_session_factory` method. Configure a :term:`session factory` which will provide signed cookie-based sessions.  The return value of this function is a :term:`session factory`, which may be provided as the ``session_factory`` argument of a :class:`pyramid.config.Configurator` constructor, or used as the ``session_factory`` argument of the :meth:`pyramid.config.Configurator.set_session_factory` method. Configure a :term:`session factory` which will provide unencrypted (but signed) cookie-based sessions.  The return value of this function is a :term:`session factory`, which may be provided as the ``session_factory`` argument of a :class:`pyramid.config.Configurator` constructor, or used as the ``session_factory`` argument of the :meth:`pyramid.config.Configurator.set_session_factory` method. Default: ``0``. Deserialize the value returned from ``signed_serialize``.  If the value cannot be deserialized for any reason, a :exc:`ValueError` exception will be raised. Hide the cookie from Javascript by setting the 'HttpOnly' flag of the session cookie. Default: ``False``. If ``True``, set a session cookie even if an exception occurs while rendering a view. If ``True``, set a session cookie even if an exception occurs while rendering a view. Default: ``True``. Parameters: Serialize any pickleable structure (``data``) and sign it using the ``secret`` (must be a string).  Return the serialization, which includes the signature as its first 40 bytes. The ``signed_deserialize`` method will deserialize such a value. The 'httpOnly' flag of the session cookie. The 'secure' flag of the session cookie. The 'secure' flag of the session cookie. Default: ``False``. The HMAC digest algorithm to use for signing. The algorithm must be supported by the :mod:`hashlib` library. Default: ``'sha512'``. The domain used for the session cookie.  Default: ``None`` (no domain). The maximum age of the cookie used for sessioning (in seconds). Default: ``None`` (browser scope). The name of the cookie used for sessioning. The name of the cookie used for sessioning. Default: ``'session'``. The number of seconds that must pass before the cookie is automatically reissued as the result of a request which accesses the session. The duration is measured as the number of seconds since the last session cookie was issued and 'now'.  If this value is ``0``, a new cookie will be reissued on every request accessing the session. If ``None`` then the cookie's lifetime will never be extended. The number of seconds that must pass before the cookie is automatically reissued as the result of accessing the session. The duration is measured as the number of seconds since the last session cookie was issued and 'now'.  If this value is ``0``, a new cookie will be reissued on every request accessing the session. If ``None`` then the cookie's lifetime will never be extended. The path used for the session cookie. The path used for the session cookie. Default: ``'/'``. The session factory returned by this function will create sessions which are limited to storing fewer than 4000 bytes of data (as the payload must fit into a single cookie). This function is useful for creating signed cookies.  For example: This function is useful for deserializing a signed cookie value created by ``signed_serialize``.  For example: This is the default serializer used by Pyramid. Use :func:`pyramid.session.SignedCookieSessionFactory` instead. Caveat: Cookies generated using ``SignedCookieSessionFactory`` are not compatible with cookies generated using ``UnencryptedCookieSessionFactory``, so existing user session data will be destroyed if you switch to it. ``cookie_domain`` ``cookie_httponly`` ``cookie_max_age`` ``cookie_name`` ``cookie_on_exception`` ``cookie_path`` ``cookie_secure`` ``domain`` ``hashalg`` ``httponly`` ``max_age`` ``path`` ``protocol`` may be specified to control the version of pickle used. Defaults to :attr:`pickle.HIGHEST_PROTOCOL`. ``reissue_time`` ``salt`` ``secret`` ``secure`` ``serializer`` ``set_on_exception`` ``signed_deserialize`` ``signed_serialize`` ``timeout`` Project-Id-Version: PROJECT VERSION
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
 (æ©æ¢°ç¿»è¨³) :mod:`pyramid.session` ç½²åä»ãã§ã·ãªã¢ã©ã¤ãºããããã¼ã¿æ§é ä½ï¼ãã¤ãåä½ï¼ã¨ã·ã¼ã¯ã¬ãããåå¾ããç½²åãæå¹ãªå ´åã¯åã®ãã¼ã¿æ§é ä½ãè¿ãå¼ã³åºãå¯è½ãªãã¸ã§ã¯ããããã©ã«ãï¼ `` signed_deserialize``ï¼pickleãä½¿ç¨ï¼ã å¤ããå°ãªããä»»æã®Pythonãã¼ã¿æ§é ã¨ã·ã¼ã¯ã¬ãããåããç¬¦å·ä»ãã·ãªã¢ã«åããã¤ãåä½ã§è¿ãã¾ããããã©ã«ãï¼ `` signed_serialize``ï¼pickleãä½¿ç¨ï¼ã çµé¨åã®ä¸­ã§ãéã¢ã¯ãã£ãã«åºã¥ãã¦èªåæéåãã®ã¯ãã­ã¼ãå¿è¦ãªå ´åï¼ `` timeout``å¤ã1200ï¼20åï¼ã«è¨­å®ãã `` reissue_time``å¤ããããã `` timeout`ã®10åã®1ã«è¨­å®ãã¦ãã ãã`å¤ï¼120åã¾ãã¯2åï¼ããã±ãããåçºè¡ãããªãã®ã§ã `` reissue_time``å¤ããã `` timeout``å¤ãä½ãè¨­å®ããã®ã¯ç¡æå³ã§ããããããªããããã®ãããªæ§æã¯æç½ã«é²æ­¢ããã¦ããªãã å±æç§å¯ã®ç°ãªãä½¿ç¨ã®éã®è¡çªãé¿ããããã®ååç©ºéãã¢ããªã±ã¼ã·ã§ã³ã®ãã¾ãã¾ãªé¨åã«å¯¾ãã¦ç§å¯ãåå©ç¨ãããã¨ã¯å¼·ãæ¨å¥¨ããã¾ããï¼refï¼ `admonishment_against_secret_sharing`åç§ï¼ãããã©ã«ãï¼ `` &#39;pyramid.session.&#39;``ã ã»ãã·ã§ã³ãã¿ã¤ã ã¢ã¦ãããã¾ã§ã®ãä½ç§ãã®éã¢ã¯ãã£ãæéã ã»ãã·ã§ã³ãã¿ã¤ã ã¢ã¦ãããã¾ã§ã®ãä½ç§ãã®éã¢ã¯ãã£ãæéã `` None``ã®å ´åãã¯ãã­ã¼ã¯æéåãã«ãªãã¾ããããã®çå­æéã¯ãã¯ãã­ã¼åã®* value *ã«ã®ã¿é©ç¨ããã¾ããã¤ã¾ãã `` max_age``ãä½ãããã«ã¯ãã­ã¼ãå¤±å¹ããå ´åããã®è¨­å®ã¯å¹æãããã¾ãããããã©ã«ãï¼ `` 1200``ã pickleãã­ãã³ã«ãä½¿ç¨ãã¦Pythonãã¼ã¿ããã¤ãã«ãã³ãããã·ãªã¢ã©ã¤ã¶ã ã¯ãã­ã¼ã«ç½²åããããã«ä½¿ç¨ãããæå­åã ã¯ãã­ã¼ã«ç½²åããããã«ä½¿ç¨ãããæå­åãç§å¯ã¯ãå°ãªãã¨ãé¸æãããããã·ã¥ã¢ã«ã´ãªãºã ã®ãã­ãã¯ãµã¤ãºã¨åãé·ãã§ãªããã°ãªãã¾ããã `` sha512``ã®å ´åãããã¯512ãããï¼64æå­ï¼ã®ç§å¯ãæå³ãã¾ãããã¾ãã¾ãªãµãã·ã¹ãã ã®ããã«Pyramidã«æä¾ãããç§å¯å¤ã®ã»ããåã§ä¸æã§ãªããã°ãªãã¾ããï¼refï¼ `admonishment_against_secret_sharing`åç§ï¼ã ãªãã¸ã§ã¯ãã«ã¯ ``èª­ã¿è¾¼ã¿ ``ã¨ ``ãã³ã ``ã®2ã¤ã®ã¡ã½ãããããã¾ãã `` loads``ã¡ã½ããã¯ãã¤ããåãåããPythonãªãã¸ã§ã¯ããè¿ãã¹ãã§ãã `` dumps``ã¡ã½ããã¯Pythonãªãã¸ã§ã¯ããåãå¥ãããã¤ããè¿ãã¹ãã§ããä¸æ­£ãªå¥åã«å¯¾ãã¦ã¯ã &quot;ValueError&quot;ãçæããå¿è¦ãããã¾ãã ãªãã¸ã§ã¯ãã«ã¯ ``èª­ã¿è¾¼ã¿ ``ã¨ ``ãã³ã ``ã®2ã¤ã®ã¡ã½ãããããã¾ãã `` loads``ã¡ã½ããã¯ãã¤ããåãåããPythonãªãã¸ã§ã¯ããè¿ãã¹ãã§ãã `` dumps``ã¡ã½ããã¯Pythonãªãã¸ã§ã¯ããåãå¥ãããã¤ããè¿ãã¹ãã§ããä¸æ­£ãªå¥åã«å¯¾ãã¦ã¯ã &quot;ValueError&quot;ãçæããå¿è¦ãããã¾ããã·ãªã¢ã©ã¤ã¶ãæ¸¡ãããªãå ´åãï¼classï¼ `pyramid.session.PickleSerializer`ã·ãªã¢ã©ã¤ã¶ãä½¿ç¨ããã¾ãã cookieãã¼ã¹ã®ã»ãã·ã§ã³ãæä¾ããaï¼termï¼ `session factory`ãè¨­å®ãã¾ãããã®é¢æ°ã®æ»ãå¤ã¯ãï¼termï¼ `session factory`ã§ããããã¯ï¼classï¼` pyramid.config.Configurator`ã³ã³ã¹ãã©ã¯ã¿ã® `` session_factory``å¼æ°ã¨ãã¦æä¾ããããã `` session_factory``ã¨ãã¦ä½¿ããã¾ãã `ï¼methï¼` pyramid.config.Configurator.set_session_factory`ã¡ã½ããã®å¼æ°ã§ãã ç½²åä»ãã®Cookieãã¼ã¹ã®ã»ãã·ã§ã³ãæä¾ããaï¼termï¼ `session factory`ãè¨­å®ãã¾ãããã®é¢æ°ã®æ»ãå¤ã¯ãï¼termï¼ `session factory`ã§ããããã¯ï¼classï¼` pyramid.config.Configurator`ã³ã³ã¹ãã©ã¯ã¿ã® `` session_factory``å¼æ°ã¨ãã¦æä¾ããããã `` session_factory``ã¨ãã¦ä½¿ããã¾ãã `ï¼methï¼` pyramid.config.Configurator.set_session_factory`ã¡ã½ããã®å¼æ°ã§ãã æå·åããã¦ããªãï¼ãããç½²åãããï¼ã¯ãã­ã¼ãã¼ã¹ã®ã»ãã·ã§ã³ãæä¾ããaï¼termï¼ `session factory`ãè¨­å®ãã¾ãããã®é¢æ°ã®æ»ãå¤ã¯ãï¼termï¼ `session factory`ã§ããããã¯ï¼classï¼` pyramid.config.Configurator`ã³ã³ã¹ãã©ã¯ã¿ã® `` session_factory``å¼æ°ã¨ãã¦æä¾ããããã `` session_factory``ã¨ãã¦ä½¿ããã¾ãã `ï¼methï¼` pyramid.config.Configurator.set_session_factory`ã¡ã½ããã®å¼æ°ã§ãã ããã©ã«ãï¼ `` 0``ã `` signed_serialize``ããè¿ãããå¤ããã·ãªã¢ã©ã¤ãºãã¾ããä½ããã®çç±ã§å¤ãéã·ãªã¢ã«åã§ããªãå ´åãaï¼excï¼ `ValueError`ä¾å¤ãéåºããã¾ãã ã»ãã·ã§ã³Cookieã® &#39;HttpOnly&#39;ãã©ã°ãè¨­å®ãã¦ãJavascriptããCookieãéè¡¨ç¤ºã«ãã¾ããããã©ã«ãï¼ `` False``ã `` True``ã®å ´åããã¥ã¼ã®ã¬ã³ããªã³ã°ä¸­ã«ä¾å¤ãçºçããå ´åã§ãã»ãã·ã§ã³ã¯ãã­ã¼ãè¨­å®ãã¾ãã `` True``ã®å ´åããã¥ã¼ã®ã¬ã³ããªã³ã°ä¸­ã«ä¾å¤ãçºçããå ´åã§ãã»ãã·ã§ã³ã¯ãã­ã¼ãè¨­å®ãã¾ããããã©ã«ãï¼ `` True``ã§ãã ãã©ã¡ã¼ã¿ã¼ï¼ pickleableæ§é ä½ï¼ `` data``ï¼ãã·ãªã¢ã©ã¤ãºãã `` secret``ï¼æå­åã§ãªããã°ãªãã¾ããï¼ãä½¿ã£ã¦ç½²åãã¾ããç½²åãæåã®40ãã¤ãã¨ãã¦å«ãç´ååãè¿ãã¾ãã `` signed_deserialize``ã¡ã½ããã¯ãã®ãããªå¤ãéç´ååãã¾ãã ã»ãã·ã§ã³Cookieã® &#39;httpOnly&#39;ãã©ã°ã ã»ãã·ã§ã³ã¯ãã­ã¼ã® &#39;å®å¨ãª&#39;ãã©ã°ã ã»ãã·ã§ã³ã¯ãã­ã¼ã® &#39;å®å¨ãª&#39;ãã©ã°ãããã©ã«ãï¼ `` False``ã ç½²åã«ä½¿ç¨ããHMACãã¤ã¸ã§ã¹ãã¢ã«ã´ãªãºã ãã¢ã«ã´ãªãºã ã¯ï¼modï¼ `hashlib`ã©ã¤ãã©ãªã§ãµãã¼ãããã¦ããªããã°ãªãã¾ãããããã©ã«ãï¼ `` &#39;sha512&#39;``ã ã»ãã·ã§ã³Cookieã«ä½¿ç¨ããããã¡ã¤ã³ãããã©ã«ãï¼ `` None``ï¼ãã¡ã¤ã³ãªãï¼ã ã»ãã·ã§ã³ã«ä½¿ç¨ãããã¯ãã­ã¼ã®æå¤§çµéæéï¼ç§åä½ï¼ãããã©ã«ãï¼ `` None``ï¼ãã©ã¦ã¶ã¹ã³ã¼ãï¼ã ã»ãã·ã§ã³ã«ä½¿ç¨ãããCookieã®ååã ã»ãã·ã§ã³ã«ä½¿ç¨ãããCookieã®ååãããã©ã«ãï¼ `` &#39;session&#39;``ã ã¯ãã­ã¼ãã»ãã·ã§ã³ã«ã¢ã¯ã»ã¹ããè¦æ±ã®çµæã¨ãã¦èªåçã«åçºè¡ãããã¾ã§ã«çµéããå¿è¦ã®ããç§æ°ãç¶ç¶æéã¯ãæå¾ã®ã»ãã·ã§ã³Cookieãçºè¡ããã¦ããã®ç§æ°ã¨ &#39;now&#39;ã¨ãã¦æ¸¬å®ããã¾ãããã®å¤ã `` 0``ã®å ´åãã»ãã·ã§ã³ã«ã¢ã¯ã»ã¹ãããã¹ã¦ã®ãªã¯ã¨ã¹ãã§æ°ããã¯ãã­ã¼ãåçºè¡ããã¾ãã `` None``ã®å ´åãã¯ãã­ã¼ã®å­ç¶æéã¯æ±ºãã¦å»¶é·ããã¾ããã ã»ãã·ã§ã³ã«ã¢ã¯ã»ã¹ããçµæãã¯ãã­ã¼ãèªåçã«åçºè¡ãããã¾ã§ã®ç§æ°ãç¶ç¶æéã¯ãæå¾ã®ã»ãã·ã§ã³Cookieãçºè¡ããã¦ããã®ç§æ°ã¨ &#39;now&#39;ã¨ãã¦æ¸¬å®ããã¾ãããã®å¤ã `` 0``ã®å ´åãã»ãã·ã§ã³ã«ã¢ã¯ã»ã¹ãããã¹ã¦ã®ãªã¯ã¨ã¹ãã§æ°ããã¯ãã­ã¼ãåçºè¡ããã¾ãã `` None``ã®å ´åãã¯ãã­ã¼ã®å­ç¶æéã¯æ±ºãã¦å»¶é·ããã¾ããã ã»ãã·ã§ã³Cookieã«ä½¿ç¨ããããã¹ã ã»ãã·ã§ã³Cookieã«ä½¿ç¨ããããã¹ãããã©ã«ãï¼ `` / &#39;``ã ãã®é¢æ°ã«ãã£ã¦è¿ãããã»ãã·ã§ã³ãã¡ã¯ããªã¯ããã¤ã­ã¼ããåä¸ã®ã¯ãã­ã¼ã«åã¾ãå¿è¦ãããããã4000ãã¤ãæªæºã®ãã¼ã¿ãæ ¼ç´ãããã¨ã«éå®ãããã»ãã·ã§ã³ãä½æãã¾ãã ãã®é¢æ°ã¯ãç½²åä»ãã®Cookieãä½æããã®ã«ä¾¿å©ã§ããä¾ãã°ï¼ ãã®é¢æ°ã¯ `` signed_serialize``ã§ä½æãããç½²åãããã¯ãã­ã¼å¤ããã·ãªã¢ã©ã¤ãºããã®ã«ä¾¿å©ã§ããä¾ãã°ï¼ ããã¯Pyramidã§ä½¿ç¨ãããããã©ã«ãã®ã·ãªã¢ã©ã¤ã¶ã§ãã ä»£ããã«ï¼funcï¼ `pyramid.session.SignedCookieSessionFactory`ãä»£ããã«ä½¿ç¨ãã¦ãã ãããè­¦åï¼ `` SignedCookieSessionFactory``ãä½¿ã£ã¦çæãããã¯ãã­ã¼ã¯ã `` UnencryptedCookieSessionFactory``ãä½¿ã£ã¦çæãããã¯ãã­ã¼ã¨äºææ§ãããã¾ããã®ã§ãæ¢å­ã®ã¦ã¼ã¶ã»ãã·ã§ã³ãã¼ã¿ã¯ãããã«åãæ¿ããã¨ç ´æ£ããã¾ãã `` cookie_domain`` `` cookie_httponly`` `` cookie_max_age`` `` cookie_name`` `` cookie_on_exception`` `` cookie_path`` `` cookie_secure`` ããã¡ã¤ã³ã ããããã«ã `` httponly`` `` max_age`` ``ãã¹ `` ä½¿ç¨ããpickleã®ãã¼ã¸ã§ã³ãå¶å¾¡ããããã« `` protocol``ãæå®ãããã¨ãã§ãã¾ããããã©ã«ãã¯ï¼attrï¼ `pickle.HIGHEST_PROTOCOL`ã§ãã `` reissue_time`` ``å¡© `` ãç§å¯ã ``å®å¨ `` ãã·ãªã¢ã©ã¤ã¶ã `` set_on_exception`` `` signed_deserialize`` `` signed_serialize`` ``ã¿ã¤ã ã¢ã¦ã `` 