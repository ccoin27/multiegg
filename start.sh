#!/bin/sh
cd /mnt/server || exit 1

case "$LANGUAGE" in
  nodejs)
    if command -v npm >/dev/null 2>&1 && [ -f package.json ]; then
      npm install
    fi
    ;;
  python)
    if command -v python3 >/dev/null 2>&1 && [ -f requirements.txt ]; then
      python3 -m pip install --upgrade pip
      python3 -m pip install -r requirements.txt
    fi
    ;;
  php)
    if [ -f composer.json ]; then
      curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
      composer install
    fi
    ;;
  *)
    echo "Unknown language specified. Skipping dependency installation."
    ;;
esac

exec $@

