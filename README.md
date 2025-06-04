# Multi-Server Repo for Pterodactyl

By https://realmnodes.space

This repository contains configs and scripts for running nginx+php, node.js, and python servers.

Set environment variables in Pterodactyl egg to control which server to start:

- USE_NODE=1 to start Node.js
- USE_PYTHON=1 to start Python Flask
- Else default runs nginx + php-fpm
