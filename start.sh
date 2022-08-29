#!/bin/sh

sudo lsof -t -i tcp:8110 | xargs kill -9

python src/main.py