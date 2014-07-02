wget
====

Wget is a free software package for retrieving files using HTTP, HTTPS and FTP,
the most widely-used Internet protocols. It is a non-interactive commandline
tool, so it may easily be called from scripts, cron jobs, terminals without
X-Windows support, etc.

Samples
-------
```
include wget
```
```
wget { '/usr/local/tomcat':
  source => [
    'http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.54/bin/apache-tomcat-7.0.54.tar.gz',
    'http://www.us.apache.org/dist/tomcat/tomcat-6/v6.0.41/bin/apache-tomcat-6.0.41.tar.gz'
  ]
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
