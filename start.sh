#!/bin/sh

echo "Starting services..."

php-fpm -D

nginx

if [ "$USE_NODE" = "1" ]; then
  echo "Starting Node.js server..."
  node /mnt/server/node/server.js &
fi

if [ "$USE_PYTHON" = "1" ]; then
  echo "Starting Python server..."
  python3 /mnt/server/python/app.py &
fi

tail -f /dev/null
