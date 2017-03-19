# Docker Image for CouchDB 1.6.1 with JWT Auth

## What is it?

* Base 1.6.1 couchdb image from [klaemo/docker-couchdb](https://github.com/klaemo/docker-couchdb/tree/master/1.6.1)
* Adds the JWT auth plugin [softapalvelin/couch_jwt_auth](https://github.com/softapalvelin/couch_jwt_auth), and fixes some dependencies so it works.
* Apply a config file with JWT settings.

## How do I use it?

To run it with your own JWT secret,
* Replace `local.ini` with your own CouchDB settings, or use as-is.  Note that the included file enables CORS.
* Modify `jwt_auth.ini` to include your secret key (base64url encoded -- not plain base64).  See [softapalvelin/couch_jwt_auth](https://github.com/softapalvelin/couch_jwt_auth) for more information on what can go there.
* Build it with `docker build -t yourname/couchdb-jwt .`
* Run with `run.sh` or see [couchdb on Dockerhub](https://hub.docker.com/_/couchdb/) for more ways to run.
