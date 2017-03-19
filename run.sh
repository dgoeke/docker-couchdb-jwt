#!/bin/sh

docker create -p 0.0.0.0:5984:5984 -v $(pwd)/data:/var/lib/couchdb dgoeke/couchdb-jwt
