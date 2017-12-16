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

RUN yum install git -y
RUN yum install which -y

RUN mkdir -p /root/helloworld-service && cd /root/helloworld-service && \
    wget http://172.17.0.1:8282/helloworld-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "/root/helloworld-service/helloworld-0.0.1-SNAPSHOT.jar"]

EXPOSE 8080
