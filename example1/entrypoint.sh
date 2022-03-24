#!/bin/bash
cd /home/cosim
cp /home/model/cosim-model.zip .
unzip cosim-model.zip
java -jar /home/cosim/maestro-2.2.0-jar-with-dependencies.jar import -output /home/output --dump-intermediate sg1 cosim.json time.json -i -vi FMI2 output-dir>debug.log 2>&1
