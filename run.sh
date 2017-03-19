#!/bin/sh

docker run -d --name couchdb -p 5984:5984 -d dgoeke/couchdb-jwt
