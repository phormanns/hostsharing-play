#!/bin/sh

CATALINA_HOME=/usr/share/tomcat7
CATALINA_BASE=/home/pacs/{{pac}}/users/{{user}}/tomcat
CATALINA_PID=/home/pacs/{{pac}}/users/{{user}}/tomcat/work/catalina.pid

# The first existing directory is used for JAVA_HOME (if JAVA_HOME is not
# defined in $DEFAULT)
JDK_DIRS="java-7-openjdk-amd64 java-7-openjdk-i386"

# Look for the right JVM to use
for jdir in $JDK_DIRS; do
  if [ -r "$jdir/bin/java" -a -z "${JAVA_HOME}" ]; then
	JAVA_HOME_TMP="$jdir"
	# checks for a real JDK like environment, needed to check if 
	# really the java-gcj-compat-dev package is installed
	if [ -r "$jdir/bin/jdb" ]; then
	    JAVA_HOME="$JAVA_HOME_TMP"
	fi
  fi
done

# Default Java options
if [ -z "$JAVA_OPTS" ]; then
	JAVA_OPTS="-Djava.awt.headless=true -Xms{{jvm_init_heap}} -Xmx{{jvm_max_heap}}  -XX:MaxPermSize={{jvm_max_perm}}"
fi
