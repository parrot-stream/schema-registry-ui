#!/bin/bash

: ${SCHEMA_REGISTRY_UI_PORT:=8000}

sed -i "s/8000/${SCHEMA_REGISTRY_UI_PORT}/g" /caddy/Caddyfile

supervisorctl start schema-registry-ui

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e "You can now access to the Schema Registy UI:\n"
echo -e "\tSchema Registy UI:   http://localhost:$SCHEMA_REGISTRY_UI_PORT"
echo -e "\nMantainer:   Matteo Capitanio <matteo.capitanio@gmail.com>"
echo -e "--------------------------------------------------------------------------------\n\n"




