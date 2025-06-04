#!/bin/sh

echo "[INFO] Starting server..."

if [ "${USE_NODE}" = "1" ]; then
  echo "[INFO] Starting Node.js server..."
  if [ -f "package.json" ]; then
    npm install
  fi
  node index.js
  exit $?
fi

if [ "${USE_PYTHON}" = "1" ]; then
  echo "[INFO] Starting Python Flask server..."

  if [ -f "app.py" ]; then
    export FLASK_APP=app.py
  elif [ -f "flask_app.py" ]; then
    export FLASK_APP=flask_app.py
  else
    echo "[ERROR] Flask app not found (app.py or flask_app.py missing)"
    exit 1
  fi
  flask run --host=0.0.0.0 --port=${SERVER_PORT:-5000}
  exit $?
fi

echo "[INFO] Starting nginx + php-fpm..."

php-fpm7 -D

nginx -g "daemon off;"

