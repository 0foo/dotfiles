# Dockerfile
FROM ruby:latest
WORKDIR /app

# node
# via: https://github.com/nodesource/distributions/blob/master/README.md#deb
# update this as more nodejs versions are released
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs

# middleman
RUN gem install middleman

