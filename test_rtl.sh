#!/usr/bin/env bash
#Script de prueba general del rtl
echo "este primer comando requiere que conectes el RTL antes de proseguir"
read -p "¿Lo has conectado? Responde con y o n = " conectado
if
    [[ "$conectado" == "y" || "$conectado" == "Y" ]]
then
    rtl_test -t
    rtl_test
else
    echo "Conecta el RTL y vuelve a intentarlo :) "
fi    
    
