#!/bin/bash

if [ "$(pidof nginx )" ]
then
  echo " processo esta ativo"
else
  echo " processo nao esta ativo"
  systemctl restart nginx
fi

