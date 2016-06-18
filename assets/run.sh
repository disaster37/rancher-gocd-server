#!/bin/sh
python /app/init.py

exec /var/lib/go-server/server.sh
