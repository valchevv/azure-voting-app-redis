#!/bin/bash

 if [[ cd azure-vote ]] ; then 
 pwd #; docker build -t jenkins-pipeline . || echo "folder not found $(pwd)"
 fi