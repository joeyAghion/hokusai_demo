FROM ruby:2.3.3
RUN apt-get update -qq && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Set up working directory
RUN mkdir /app

# Set up gems
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install -j4

# Finally, add the rest of our app's code
# (this is done at the end so that changes to our app's code
# don't bust Docker's cache)
ADD . /app
WORKDIR /app

ENV PORT 80
EXPOSE 80
