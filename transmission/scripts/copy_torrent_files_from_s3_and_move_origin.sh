#!/bin/sh

aws s3 cp s3://transmission-project/watch/ /watch/ --exclude "*" --include "*.torrent" --recursive
aws s3 mv s3://transmission-project/watch/ s3://transmission-project/added/ --exclude "*" --include "*.torrent" --recursive
