#!/usr/bin/env bash

#env
#NOMBRE_BASE
#TOBA_HOME
#TOBA_ID_DESARROLLADOR
#PG_PASS
#TOBA_PASS
#PG_PORT=5432

# INSTALAR TOBA
echo "start ======== ${TOBA_ID_DESARROLLADOR}" > /tmp/log
# INSTALAR TOBA
ID_TOBA=${TOBA_ID_DESARROLLADOR}
echo -n ${PG_PASS} > /tmp/clave_pg
echo -n ${TOBA_PASS} > /tmp/clave_toba
printf "\n" | ${TOBA_HOME}/bin/instalar -d ${ID_TOBA} -t 0 -h localhost -p ${PG_PORT} -u postgres -b ${NOMBRE_BASE} -c /tmp/clave_pg -k /tmp/clave_toba >> /tmp/log

rm /tmp/clave_pg /tmp/clave_toba

ln -s ${TOBA_HOME}/instalacion/toba.conf /etc/apache2/sites-enabled/toba.conf
