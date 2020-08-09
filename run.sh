#! /usr/bin/env sh

gunicorn --workers=4 --threads=4 --keep-alive=15 -b 0.0.0.0:5000 --reload 'wsgi:app'
