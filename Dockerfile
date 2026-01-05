FROM ruby:3.2-alpine

RUN apk add --no-cache \
    build-base \
    gcc \
    cmake \
    git \
    linux-headers

WORKDIR /site

COPY Gemfile Gemfile.lock* ./

RUN bundle install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]
