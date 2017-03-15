FROM attensee/s3_website

# install nodejs
#
# credit: https://hub.docker.com/r/readytalk/nodejs/~/dockerfile/
RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates
RUN mkdir /nodejs && curl http://nodejs.org/dist/v6.4.0/node-v6.4.0-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin

# Install bower
RUN npm install -g bower

# Configure for s3_website usage
#
# credit: https://hub.docker.com/r/attensee/s3_website/~/dockerfile/
ENTRYPOINT ["s3_website"]
