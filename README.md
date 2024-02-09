# Spring Boot logging issues

This is a simple application to demonstrate the issues with
the spring-boot-maven-plugin, in relation to log4j2 and setting the `java.util.logging.manager` VM property on startup

Logged before Spring even initializes
```
Could not load Logmanager "org.apache.logging.log4j.jul.LogManager"
java.lang.ClassNotFoundException: org.apache.logging.log4j.jul.LogManager
at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:641)
at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:188)
at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:520)
at java.logging/java.util.logging.LogManager$1.run(LogManager.java:239)
at java.logging/java.util.logging.LogManager$1.run(LogManager.java:223)
at java.base/java.security.AccessController.doPrivileged(AccessController.java:318)
at java.logging/java.util.logging.LogManager.<clinit>(LogManager.java:222)
at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)
at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
at java.base/java.lang.reflect.Method.invoke(Method.java:568)
at java.management/sun.management.ManagementFactoryHelper$LoggingMXBeanAccess.getMXBeanImplementation(ManagementFactoryHelper.java:243)
```

Run application
```sh
docker-compose up
```

See 
 - https://github.com/spring-projects/spring-boot/issues/6626
 - https://github.com/spring-projects/spring-boot/issues/12659#issuecomment-397576902