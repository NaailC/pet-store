#!/bin/bash

sed -e 's,{{MYSQL_ROOT_PASSWORD}},'$MYSQL_ROOT_PASSWORD',g;' secrets.yaml | kubectl apply -f -