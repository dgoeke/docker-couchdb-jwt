# docker-couchdb+jwt

## What is it?

* Base 1.6.1 couchdb image from [klaemo/docker-couchdb](https://github.com/klaemo/docker-couchdb/tree/master/1.6.1)
* Build/install the JWT auth plugin [softapalvelin/couch_jwt_auth](https://github.com/softapalvelin/couch_jwt_auth), and fix some dependencies so it works.
* Apply a config file with JWT settings.

## How To Build

To run it with your own JWT secret,
* Create a new `local.ini` with: `cp local.ini.example local.ini`.  Note that the sample file enables CORS, so disable this if it's not desired.
* Modify at least the setting for `jwt_auth.hs_secret`.
* Build it with `docker build -t yourname/couchdb-jwt .`

## How to Run

For details on running, see [couchdb on Dockerhub](https://hub.docker.com/_/couchdb/).
