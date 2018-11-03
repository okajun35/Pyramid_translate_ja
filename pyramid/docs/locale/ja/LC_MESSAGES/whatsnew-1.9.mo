��    &      L              |     }     �  �   �  $  \  �   �  �        �     �  |  �  W  o	     �
     �
  P  �
     @     X  (  p  '   �  o  �  �  1  l  �  _   U  /   �  �   �  �  �  �  3  �    }   �    7  }   E  �   �  �  R  �   0  9     �  H!     �"  K  �"  �  4$  �  &     �'     �'  �   �'  $  y(  �   �)  �   "*     �*     �*  |  +  W  �.     �/     �/  P  0     ]1     u1  (  �1  '   �2  o  �2  �  N4  l  8  _   r9  /   �9  �   :  �  �:  �  P<  �  !>  }   �?    T@  }   bA  �   �A  �  oB  �   MD  9  +E  �  eF     �G  K  H  �  QI   :ref:`changes_1.9.1` :ref:`changes_1.9.2` Add a ``quote_via`` argument to :func:`pyramid.encode.urlencode` to follow the stdlib's version and enable custom quoting functions. See https://github.com/Pylons/pyramid/pull/3088 Added an :term:`execution policy` hook to the request pipeline. An execution policy has the ability to control creation and execution of the request objects before they enter the rest of the pipeline. This means for a single request environ the policy may create more than one request object. Added the :term:`execution policy` to the routing diagram in :ref:`router_chapter`. See https://github.com/Pylons/pyramid/pull/2993 Also, ``pyramid.session.check_csrf_token`` is now located at :func:`pyramid.csrf.check_csrf_token` and ``pyramid.session.check_csrf_origin`` is moved to :func:`pyramid.csrf.check_csrf_origin`. Backward Incompatibilities Bug Fix Releases CSRF support has been refactored out of sessions and into its own independent API in the :mod:`pyramid.csrf` module. It supports a pluggable :class:`pyramid.interfaces.ICSRFStoragePolicy` which can be used to define your own mechanism for generating and validating CSRF tokens. By default, Pyramid continues to use the :class:`pyramid.csrf.LegacySessionCSRFStoragePolicy` that uses the ``request.session.get_csrf_token`` and ``request.session.new_csrf_token`` APIs under the hood to preserve compatibility with older Pyramid applications. Two new policies are shipped as well, :class:`pyramid.csrf.SessionCSRFStoragePolicy` and :class:`pyramid.csrf.CookieCSRFStoragePolicy` which will store the CSRF tokens in the session and in a standalone cookie, respectively. The storage policy can be changed by using the new :meth:`pyramid.config.Configurator.set_csrf_storage_policy` config directive. CSRF tokens should be used via the new :func:`pyramid.csrf.get_csrf_token`, :func:`pyramid.csrf.new_csrf_token` and :func:`pyramid.csrf.check_csrf_token` APIs in order to continue working if the storage policy is changed. Also, the :func:`pyramid.csrf.get_csrf_token` function is now injected into templates to be used conveniently in UI code. Deprecations Documentation Enhancements For now, Pyramid is still shipping with integrated support for the PasteDeploy INI format by depending on the `plaster_pastedeploy <https://github.com/Pylons/plaster_pastedeploy>`_ binding library. This may change in the future so it is recommended for applications to start depending on the appropriate plaster binding for their needs. Major Feature Additions Minor Feature Additions Normalize the permission results to a proper class hierarchy. :class:`pyramid.security.ACLAllowed` is now a subclass of :class:`pyramid.security.Allowed` and :class:`pyramid.security.ACLDenied` is now a subclass of :class:`pyramid.security.Denied`. See https://github.com/Pylons/pyramid/pull/3084 Pyramid 1.9 was released on 2017-06-26. Pyramid currently depends on ``plaster_pastedeploy`` to simplify the transition to ``plaster`` by maintaining integrated support for INI files. This dependency on ``plaster_pastedeploy`` should be considered subject to Pyramid's deprecation policy and may be removed in the future. Applications should depend on the appropriate plaster binding to satisfy their needs. Pyramid's default :term:`execution policy` will attempt to handle and render uncaught exceptions. This is a subtle, but fundamental, change indicating that an :term:`exception view` may expect to be called outside of the default ``EXCVIEW`` tween. There are various predicates available to assist in defining valid exception views for various parts of the pipeline. For example, ``pyramid_tm`` defines the ``tm_active=True`` predicate which can be applied to exception views that require access to the default transaction. In general this means that exception views may be expected to cover more possible error conditions, including when exceptions occur from tweens that are placed **OVER** the ``EXCVIEW`` tween. If necessary, when provided a ``response`` object, you may inspect  ``request.exception`` or ``request.exc_info`` to determine if the response was generated as the result of an exception. See https://github.com/Pylons/pyramid/pull/2964 Retrieving CSRF token from the session has been deprecated in favor of equivalent methods in the :mod:`pyramid.csrf` module. The CSRF methods (``ISession.get_csrf_token`` and ``ISession.new_csrf_token``) are no longer required on the :class:`pyramid.interfaces.ISession` interface except when using the default :class:`pyramid.csrf.LegacySessionCSRFStoragePolicy`. See https://github.com/Pylons/pyramid/pull/2854 and https://github.com/Pylons/pyramid/pull/3019 See https://github.com/Pylons/pyramid/pull/2985 Similar behavior occurs with :meth:`pyramid.request.Request.invoke_exception_view` in which the exception properties are set to reflect the exception if a response is successfully generated by the method. Support `_query=None` and `_anchor=None` in :meth:`pyramid.request.Request.route_url` as well as ``query=None`` and ``anchor=None`` in :meth:`pyramid.request.Request.resource_url`. Previously this would cause an `?` and a `#`, respectively, in the url with nothing after it. Now the unnecessary parts are dropped from the generated URL. See https://github.com/Pylons/pyramid/pull/3034 Support an ``open_url`` config setting in the ``pserve`` section of the config file. This url is used to open a web browser when ``pserve --browser`` is invoked. When this setting is unavailable the ``pserve`` script will attempt to guess the port the server is using from the ``server:<server_name>`` section of the config file but there is no requirement that the server is being run in this format so it may fail. See https://github.com/Pylons/pyramid/pull/2984 The :class:`pyramid.config.Configurator` can now be used as a context manager which will automatically push/pop threadlocals (similar to :meth:`pyramid.config.Configurator.begin` and :meth:`pyramid.config.Configurator.end`). It will also automatically perform a :meth:`pyramid.config.Configurator.commit` at the end and thus it is only recommended to be used at the top-level of your app. See https://github.com/Pylons/pyramid/pull/2874 The execution policy can be replaced using the new :meth:`pyramid.config.Configurator.set_execution_policy` config directive. The file format used by all ``p*`` command line scripts such as ``pserve`` and ``pshell``, as well as the :func:`pyramid.paster.bootstrap` function is now replaceable thanks to a new dependency on `plaster <https://docs.pylonsproject.org/projects/plaster/en/latest/>`_. The first library to use this feature is `pyramid_retry <https://docs.pylonsproject.org/projects/pyramid-retry/en/latest/>`_. The following bug fix releases were made since then. Bug fix releases also include documentation improvements and other minor feature changes. The threadlocals are now available inside any function invoked via :meth:`pyramid.config.Configurator.include`. This means the only config-time code that cannot rely on threadlocals is code executed from non-actions inside the main. This can be alleviated by invoking :meth:`pyramid.config.Configurator.begin` and :meth:`pyramid.config.Configurator.end` appropriately or using the new context manager feature of the configurator. See https://github.com/Pylons/pyramid/pull/2989 The threadlocals are now available inside exception views invoked via :meth:`pyramid.request.Request.invoke_exception_view` even when the ``request`` argument is overridden. See https://github.com/Pylons/pyramid/pull/3060 This article explains the new features in :app:`Pyramid` version 1.9 as compared to its predecessor, :app:`Pyramid` 1.8. It also documents backwards incompatibilities between the two versions and deprecations added to :app:`Pyramid` 1.9, as well as software dependency changes and notable documentation additions. This is a very minor incompatibility. Most tweens right now would give priority to the raised exception and ignore ``request.exception``. This change just improves and clarifies that bookkeeping by trying to be more clear about the relationship between the response and its squashed exception. See https://github.com/Pylons/pyramid/pull/3029 and https://github.com/Pylons/pyramid/pull/3031 What's New in Pyramid 1.9 When unsupported predicates are supplied to :meth:`pyramid.config.Configurator.add_view`, :meth:`pyramid.config.Configurator.add_route` and :meth:`pyramid.config.Configurator.add_subscriber` a much more helpful error message is output with a guess as to which predicate was intended. See https://github.com/Pylons/pyramid/pull/3054 ``request.exception`` and ``request.exc_info`` will only be set if the response was generated by the EXCVIEW tween. This is to avoid any confusion where a response was generated elsewhere in the pipeline and not in direct relation to the original exception. If anyone upstream wants to catch and render responses for exceptions they should set ``request.exception`` and ``request.exc_info`` themselves to indicate the exception that was squashed when generating the response. Project-Id-Version: The Pyramid Web Framework 1.9.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-10-28 18:07+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 :ref:`changes_1.9.1` :ref:`changes_1.9.2` Add a ``quote_via`` argument to :func:`pyramid.encode.urlencode` to follow the stdlib's version and enable custom quoting functions. See https://github.com/Pylons/pyramid/pull/3088 Added an :term:`execution policy` hook to the request pipeline. An execution policy has the ability to control creation and execution of the request objects before they enter the rest of the pipeline. This means for a single request environ the policy may create more than one request object. Added the :term:`execution policy` to the routing diagram in :ref:`router_chapter`. See https://github.com/Pylons/pyramid/pull/2993 Also, ``pyramid.session.check_csrf_token`` is now located at :func:`pyramid.csrf.check_csrf_token` and ``pyramid.session.check_csrf_origin`` is moved to :func:`pyramid.csrf.check_csrf_origin`. Backward Incompatibilities Bug Fix Releases CSRF support has been refactored out of sessions and into its own independent API in the :mod:`pyramid.csrf` module. It supports a pluggable :class:`pyramid.interfaces.ICSRFStoragePolicy` which can be used to define your own mechanism for generating and validating CSRF tokens. By default, Pyramid continues to use the :class:`pyramid.csrf.LegacySessionCSRFStoragePolicy` that uses the ``request.session.get_csrf_token`` and ``request.session.new_csrf_token`` APIs under the hood to preserve compatibility with older Pyramid applications. Two new policies are shipped as well, :class:`pyramid.csrf.SessionCSRFStoragePolicy` and :class:`pyramid.csrf.CookieCSRFStoragePolicy` which will store the CSRF tokens in the session and in a standalone cookie, respectively. The storage policy can be changed by using the new :meth:`pyramid.config.Configurator.set_csrf_storage_policy` config directive. CSRF tokens should be used via the new :func:`pyramid.csrf.get_csrf_token`, :func:`pyramid.csrf.new_csrf_token` and :func:`pyramid.csrf.check_csrf_token` APIs in order to continue working if the storage policy is changed. Also, the :func:`pyramid.csrf.get_csrf_token` function is now injected into templates to be used conveniently in UI code. Deprecations Documentation Enhancements For now, Pyramid is still shipping with integrated support for the PasteDeploy INI format by depending on the `plaster_pastedeploy <https://github.com/Pylons/plaster_pastedeploy>`_ binding library. This may change in the future so it is recommended for applications to start depending on the appropriate plaster binding for their needs. Major Feature Additions Minor Feature Additions Normalize the permission results to a proper class hierarchy. :class:`pyramid.security.ACLAllowed` is now a subclass of :class:`pyramid.security.Allowed` and :class:`pyramid.security.ACLDenied` is now a subclass of :class:`pyramid.security.Denied`. See https://github.com/Pylons/pyramid/pull/3084 Pyramid 1.9 was released on 2017-06-26. Pyramid currently depends on ``plaster_pastedeploy`` to simplify the transition to ``plaster`` by maintaining integrated support for INI files. This dependency on ``plaster_pastedeploy`` should be considered subject to Pyramid's deprecation policy and may be removed in the future. Applications should depend on the appropriate plaster binding to satisfy their needs. Pyramid's default :term:`execution policy` will attempt to handle and render uncaught exceptions. This is a subtle, but fundamental, change indicating that an :term:`exception view` may expect to be called outside of the default ``EXCVIEW`` tween. There are various predicates available to assist in defining valid exception views for various parts of the pipeline. For example, ``pyramid_tm`` defines the ``tm_active=True`` predicate which can be applied to exception views that require access to the default transaction. In general this means that exception views may be expected to cover more possible error conditions, including when exceptions occur from tweens that are placed **OVER** the ``EXCVIEW`` tween. If necessary, when provided a ``response`` object, you may inspect  ``request.exception`` or ``request.exc_info`` to determine if the response was generated as the result of an exception. See https://github.com/Pylons/pyramid/pull/2964 Retrieving CSRF token from the session has been deprecated in favor of equivalent methods in the :mod:`pyramid.csrf` module. The CSRF methods (``ISession.get_csrf_token`` and ``ISession.new_csrf_token``) are no longer required on the :class:`pyramid.interfaces.ISession` interface except when using the default :class:`pyramid.csrf.LegacySessionCSRFStoragePolicy`. See https://github.com/Pylons/pyramid/pull/2854 and https://github.com/Pylons/pyramid/pull/3019 See https://github.com/Pylons/pyramid/pull/2985 Similar behavior occurs with :meth:`pyramid.request.Request.invoke_exception_view` in which the exception properties are set to reflect the exception if a response is successfully generated by the method. Support `_query=None` and `_anchor=None` in :meth:`pyramid.request.Request.route_url` as well as ``query=None`` and ``anchor=None`` in :meth:`pyramid.request.Request.resource_url`. Previously this would cause an `?` and a `#`, respectively, in the url with nothing after it. Now the unnecessary parts are dropped from the generated URL. See https://github.com/Pylons/pyramid/pull/3034 Support an ``open_url`` config setting in the ``pserve`` section of the config file. This url is used to open a web browser when ``pserve --browser`` is invoked. When this setting is unavailable the ``pserve`` script will attempt to guess the port the server is using from the ``server:<server_name>`` section of the config file but there is no requirement that the server is being run in this format so it may fail. See https://github.com/Pylons/pyramid/pull/2984 The :class:`pyramid.config.Configurator` can now be used as a context manager which will automatically push/pop threadlocals (similar to :meth:`pyramid.config.Configurator.begin` and :meth:`pyramid.config.Configurator.end`). It will also automatically perform a :meth:`pyramid.config.Configurator.commit` at the end and thus it is only recommended to be used at the top-level of your app. See https://github.com/Pylons/pyramid/pull/2874 The execution policy can be replaced using the new :meth:`pyramid.config.Configurator.set_execution_policy` config directive. The file format used by all ``p*`` command line scripts such as ``pserve`` and ``pshell``, as well as the :func:`pyramid.paster.bootstrap` function is now replaceable thanks to a new dependency on `plaster <https://docs.pylonsproject.org/projects/plaster/en/latest/>`_. The first library to use this feature is `pyramid_retry <https://docs.pylonsproject.org/projects/pyramid-retry/en/latest/>`_. The following bug fix releases were made since then. Bug fix releases also include documentation improvements and other minor feature changes. The threadlocals are now available inside any function invoked via :meth:`pyramid.config.Configurator.include`. This means the only config-time code that cannot rely on threadlocals is code executed from non-actions inside the main. This can be alleviated by invoking :meth:`pyramid.config.Configurator.begin` and :meth:`pyramid.config.Configurator.end` appropriately or using the new context manager feature of the configurator. See https://github.com/Pylons/pyramid/pull/2989 The threadlocals are now available inside exception views invoked via :meth:`pyramid.request.Request.invoke_exception_view` even when the ``request`` argument is overridden. See https://github.com/Pylons/pyramid/pull/3060 This article explains the new features in :app:`Pyramid` version 1.9 as compared to its predecessor, :app:`Pyramid` 1.8. It also documents backwards incompatibilities between the two versions and deprecations added to :app:`Pyramid` 1.9, as well as software dependency changes and notable documentation additions. This is a very minor incompatibility. Most tweens right now would give priority to the raised exception and ignore ``request.exception``. This change just improves and clarifies that bookkeeping by trying to be more clear about the relationship between the response and its squashed exception. See https://github.com/Pylons/pyramid/pull/3029 and https://github.com/Pylons/pyramid/pull/3031 What's New in Pyramid 1.9 When unsupported predicates are supplied to :meth:`pyramid.config.Configurator.add_view`, :meth:`pyramid.config.Configurator.add_route` and :meth:`pyramid.config.Configurator.add_subscriber` a much more helpful error message is output with a guess as to which predicate was intended. See https://github.com/Pylons/pyramid/pull/3054 ``request.exception`` and ``request.exc_info`` will only be set if the response was generated by the EXCVIEW tween. This is to avoid any confusion where a response was generated elsewhere in the pipeline and not in direct relation to the original exception. If anyone upstream wants to catch and render responses for exceptions they should set ``request.exception`` and ``request.exc_info`` themselves to indicate the exception that was squashed when generating the response. 