FROM ruby:2.5

EXPOSE 3000

RUN set -x \
 && apt update -qq \
 && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
 && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && apt update -qq \
 && apt install -y --no-install-recommends \
    google-chrome-stable \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

RUN bundle config build.nokogiri --use-system-libraries

CMD [ "rails s" ]
