#!/bin/bash

CMD=$1

JUPYTER_TOKEN="qiskit"
NOTEBOOKS_DIR="/notebooks" 
QISKIT_HOME="/home/qiskit"
MINICONDA_HOME="/miniconda3" 
PATH="$PATH:${MINICONDA_HOME}/bin:${QISKIT_HOME}/.local/bin" 
export JUPYTER_TOKEN PATH 

cd ${NOTEBOOKS_DIR} 

cat <<DATA
CMD            = ${CMD}
JUPYTER_TOKEN  = ${JUPYTER_TOKEN}
NOTEBOOKS_DIR  = ${NOTEBOOKS_DIR}
QISKIT_HOME    = ${QISKIT_HOME}
MINICONDA_HOME = ${MINICONDA_HOME}
PATH           = ${PATH}
DATA

if [[ -z "$CMD" ]]; then
  exec jupyter lab --ip=0.0.0.0 --no-browser 
else
  exec "$@"
fi

#::END::
