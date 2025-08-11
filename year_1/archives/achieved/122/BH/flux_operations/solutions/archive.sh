#!/bin/bash

PATTERN="\.sh$"

name="mesScripts.tar.gz"
FILES=$(ls | grep "$PATTERN")
tar -czvf $name $FILES
echo "L'archive $name a été créé"
