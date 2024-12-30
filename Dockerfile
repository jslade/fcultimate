FROM ruby:2.7.6

ENV RAILS_ENV=development

# https://yarnpkg.com/lang/en/docs/install/#debian-stable
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn vim

ENV APP_ROOT /app
COPY . $APP_ROOT
WORKDIR $APP_ROOT

ENV BUNDLE_PATH /app/vendor/bundle
RUN gem install bundler -v 2.4.22
RUN bundle update --bundler
RUN bundle install
RUN bundle exec yarn install

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000
