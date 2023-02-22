#!/bin/bash
cd /home/cosim
wget ${MODEL_URL}
unzip cosim-model.zip
java -jar /home/cosim/coe-1.0.10-jar-with-dependencies.jar --configuration cosim.json --oneshot --starttime 0.0 --endtime 20.0 1>/home/output/debug.log 2>&1
cp output.csv /home/output/
