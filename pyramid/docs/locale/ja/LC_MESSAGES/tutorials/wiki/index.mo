Þ          <               \     ]   0  |     ­    Ì  T  S  ¨  ¨  8   Q   For cut and paste purposes, the source code for all stages of this tutorial can be browsed on GitHub at `GitHub <https://github.com/Pylons/pyramid/>`_ for a specific branch or version under ``docs/tutorials/wiki/src``, which corresponds to the same location if you have Pyramid sources. This tutorial introduces a :term:`ZODB` and :term:`traversal`-based :app:`Pyramid` application to a developer familiar with Python.  It will be most familiar to developers with previous :term:`Zope` experience.  When finished, the developer will have created a basic Wiki application with authentication. ZODB + Traversal Wiki Tutorial Project-Id-Version: PROJECT VERSION
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
 ã«ããã¢ã³ããã¼ã¹ãã®ç®çã®ããã«ããã®ãã¥ã¼ããªã¢ã«ã®ãã¹ã¦ã®æ®µéã®ã½ã¼ã¹ã³ã¼ãã¯ãGitHubã® `GitHub <https://github.com/Pylons/pyramid/> `_ docs / tutorials / wiki / src`ã®ä¸ã«ããç¹å®ã®ãã©ã³ãããã¼ã¸ã§ã³ã®Pythonã½ã¼ã¹ãããã°åãå ´æã«å¯¾å¿ãã¦ãã¾ãã ãã®ãã¥ã¼ããªã¢ã«ã§ã¯ãtermï¼ `ZODB`ã¨ï¼termï¼` traversal`ãã¼ã¹ã®ï¼appï¼ `Pyramid`ã¢ããªã±ã¼ã·ã§ã³ãPythonã«ç²¾éããéçºèã«ç´¹ä»ãã¾ããããã¯ãä»¥åã®ï¼termï¼ `Zope`ã¨ã¯ã¹ããªã¨ã³ã¹ãæã¤éçºèã«ã¨ã£ã¦æãããç¥ããã¦ãã¾ããä½æ¥­ãçµäºããã¨ãéçºèã¯åºæ¬çãªWikiã¢ããªã±ã¼ã·ã§ã³ãä½æãã¦èªè¨¼ãã¾ãã (æ©æ¢°ç¿»è¨³)ZODB + Traversal Wikiãã¥ã¼ããªã¢ã« 