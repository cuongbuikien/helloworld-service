FROM centos:centos7

MAINTAINER Cuong Bui <cuong.buikien@team.telstra.com>

RUN yum -y upgrade && \
    yum -y update && \
    yum -y install wget unzip findutils && \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm" && \
    rpm -Uvh jdk-8u151-linux-x64.rpm && \
    yum -y clean all && \
    rm -f jdk-8u151-linux-x64.rpm

    # echo "1ffe998845b594c66db2703dd5f60d88  jdk-8u102-linux-x64.rpm" >> MD5SUM8 && \
    #md5sum -c MD5SUM8 && \

ENV MAVEN_VERSION 3.3.9
RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
RUN yum install which -y
RUN yum install git -y
ENV MAVEN_HOME /usr/share/maven

VOLUME /root/.m2
