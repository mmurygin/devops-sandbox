#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/tls.key -out ssl/tls.crt -subj "/CN=kuber.local"
