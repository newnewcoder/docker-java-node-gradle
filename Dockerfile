FROM ubuntu:18.04
MAINTAINER Karl J. Overå

ENV NODE_VERSION 10.10.0
ENV GRADLE_VERSION 4.10.1

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk wget curl unzip xz-utils python build-essential ssh git

# Setup certificates in openjdk-8
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

# Set path
ENV PATH ${PATH}:/usr/local/gradle-$GRADLE_VERSION/bin
WORKDIR /usr/local

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# Install gradle
RUN wget https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip

WORKDIR /app
