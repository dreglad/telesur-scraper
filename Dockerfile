FROM scrapinghub/scrapinghub-stack-scrapy:1.5-py3

ENV TERM xterm

ENV SCRAPY_SETTINGS_MODULE telesurscraper.settings

ENV PRISMA_ENDPOINT='http://172.17.0.1:4466/'
ENV PRISMA_TOKEN=
ENV SERVICE_ID=
ENV SCHEDULE_URL=
ENV SCHEDULE_TIMEZONE='UTC'

RUN apt-get update
RUN apt-get install -y libtidy-dev

RUN mkdir -p /app
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app
RUN python setup.py install
