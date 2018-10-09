#!/bin/bash

: ${PORT:=8000}

supervisorctl start schema-registry-ui

/wait-for-it.sh localhost:$PORT -t 20
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n--------------------------------------------"
    echo -e "   Schema Registry UI not ready! Exiting..."
    echo -e "--------------------------------------------"
    exit $rc
fi

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e "You can now access to the Schema Registy UI:\n"
echo -e "\tSchema Registy UI:   http://localhost:$PORT"
echo -e "\nMantainer:   Matteo Capitanio <matteo.capitanio@gmail.com>"
echo -e "--------------------------------------------------------------------------------\n\n"




