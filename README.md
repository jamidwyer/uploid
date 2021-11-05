# uploid

Work in progress.

## Goals and status

The goal of uploid is a pipeline that:

- takes FASTA input sequences via a web interface

  - status: react-web-gui exists but doesn't take sequence input from a user

  - tasks:
    - take sequence from user
    - send sequence through pipeline
    - send sequence (and result) to database

- checks input sequence against dbSNP and/or TCGA

  - status: ./scripts/align.sh does this, in a very scaled-down way

  - tasks:
    - make this run when a new sequence comes in
    - scale

- runs anything interesting through reactome

  - status: this looks cool https://reactome.org/dev/graph-database

  - tasks:
    - see how to run reactome

- stores the analysis in SQL Server

  - status: SQL server runs in Docker

  - tasks:

    - build db from swagger https://app.swaggerhub.com/apis/jami/sequencesv1/1.0.0#/Tag

    - persist data

    - database backups

    - better sequence schema -- standards?

    - better analysis schema -- standards?

- presents results back to the user

  - status: none

  - tasks:

    - evaluate options:
      - geneviewer? genomeviewer?
      - ijvjs?
      - d3

- user can search previous results

  - status: none

  - tasks:

    - evaluate options

      - elasticsearch?

Currently, docker-compose.yml pulls in a rudimentary React app that will (but does not yet) take sequence input and present results. It also starts SQL Server to store user input. There's also a shell script that runs blastn.

## Usage

`docker-compose up`
