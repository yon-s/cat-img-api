FROM --platform=linux/x86_64 ruby:3.2.2

ENV APP="/cat-img-api"  \
    CONTAINER_ROOT="./" 

RUN apt-get update && apt-get install -y \
        nodejs \
        mariadb-client \
        build-essential \
        wget \
        yarn

WORKDIR $APP
COPY Gemfile Gemfile.lock $CONTAINER_ROOT
RUN bundle install
RUN rails webpacker:install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

VOLUME ["/cat-img-api/public"]
VOLUME ["/cat-img-api/tmp"]


CMD ["unicorn", "-p", "3000", "-c", "/cat-img-api/config/unicorn.rb", "-E", "$RAILS_ENV"]
