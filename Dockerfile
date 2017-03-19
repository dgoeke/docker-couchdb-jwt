FROM couchdb:1.6.1

MAINTAINER David Goeke <github@waygate.org>

RUN apt-get update && apt-get install -y make rebar

WORKDIR /root
RUN curl -L https://github.com/softapalvelin/couch_jwt_auth/archive/e87a8cc6030891532312d4694e8da02c8e560e10.tar.gz \
            | tar xzv --transform 's/-e87.*560e10//' \
    && mkdir couch_jwt_auth/deps \
    && curl -L https://codeload.github.com/talentdeficit/jsx/tar.gz/v2.8.0 \
            | tar xzv -C couch_jwt_auth/deps --transform 's/jsx-2.8.0/jsx/' \
    && curl -L https://github.com/artefactop/ejwt/archive/0.1.0.tar.gz \
               | tar xzv -C couch_jwt_auth/deps --transform 's/ejwt-0.1.0/ejwt/' \
    && cd couch_jwt_auth \
    && rebar get-deps compile \
    && make plugin \
    && mkdir -p /usr/local/lib/couchdb/plugins/ \
    && cp -R couch_jwt_auth-1.0.1-17-1.6.1 /usr/local/lib/couchdb/plugins/

COPY local.ini /usr/local/etc/couchdb/local.ini
