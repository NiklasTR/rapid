#!/bin/sh
aws s3 sync ~/rapid/ s3://ascstore/rapid  --exclude "git*"
