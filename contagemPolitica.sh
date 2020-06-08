#!/bin/bash
#
# Copyleft (c) 2020 Carlos Romel Pereira da Silva <carlos.romel@gmail.com>
#
ORIGEM=${1:-contagemPolitica.txt}

if [ -f "${ORIGEM}" ]; then
    PALAVRAS=$(basename ${ORIGEM} .txt).token
    cat ${ORIGEM} | tr " " "\n" > ${PALAVRAS}
    
    for PARTIDO in AVANTE CIDADANIA DC DEM MDB  NOVO PATRIOTA PCB  PCO PCdoB PDT \
                   PL     PMB       PMN    PODE PP   PROS     PRTB PSB PSC   PSD \
                   PSDB   PSL       PSOL   PSTU PT   PTB      PTC  PV  REDE \
                   REPUBLICANOS     SOLIDARIEDADE    UP; do
        OCORRENCIAS=$(grep ${PARTIDO} ${PALAVRAS} | wc -l)
        printf "%4d %s\n" ${OCORRENCIAS} ${PARTIDO}
    done | sort -rn
else
    echo "Informe o nome de um arquivo para análise."
fi
