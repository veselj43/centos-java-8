FROM registry.centos.org/centos:latest

RUN yum -y install java-1.8.0-openjdk && \
    yum -y install wget curl unzip dos2unix rpm-build rpmdevtools git openssh-clients epel-release https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi && \
    yum -y install vips vips-devel make gcc-c++.x86_64 && \
    yum clean all && \
    wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-3.4.1-bin.zip

ENV JAVA_VERSION 8 \
    JAVA_LIBDIR=/usr/share/java \
    JNI_LIBDIR=/usr/lib/java \
    JVM_ROOT=/usr/lib/jvm \
    JAVA_HOME=$JVM_ROOT/java \
    PATH=$PATH:$JAVA_HOME/bin:/opt/gradle/gradle-3.4.1/bin \
    CLASSPATH=$JAVA_HOME/lib
