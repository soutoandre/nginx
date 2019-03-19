#!/bin/bash

if [ "$(pidof /usr/local/node/bin/node )" ]
then
  echo " processo esta ativo"
else
  echo " processo nao esta ativo"
  systemctl restart pm2-node.service
fi

