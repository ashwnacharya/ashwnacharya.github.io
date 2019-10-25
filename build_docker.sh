#!/bin/bash
bundle exec jekyll build
SHORT_SHA=`git rev-parse --short HEAD`
docker build -t blog:$SHORT_SHA .
docker tag blog:$SHORT_SHA ashwnacharya.azurecr.io/blog:$SHORT_SHA
docker push ashwnacharya.azurecr.io/blog:$SHORT_SHA

