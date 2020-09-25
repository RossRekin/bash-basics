#!/bin/bash

function file_count()
  {
      local DIRECTORY=$1
      local NUMBER_OF_FILES=$(ls $DIRECTORY | wc -l)
      echo $DIRECTORY
      echo $NUMBER_OF_FILES
  }

file_count /etc
file_count /usr/bin
file_count /var
