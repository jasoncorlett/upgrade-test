FROM alpine

RUN apk add bash

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY wrapper.sh /wrapper.sh

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

ARG MESSAGE="<Le Null>"
ARG VERSION=":("

RUN sed -i "s/##SCRIPT_VERSION##/$VERSION/" /wrapper.sh
RUN echo "$MESSAGE" > /message.txt

