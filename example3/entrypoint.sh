#!/bin/bash
while true
do
    # wait
    sleep 60

    # model not available
    if [[ ! -f "/home/model/cosim-model.zip" || -f "/home/model/SYNC.LCK" ]]
    then
        echo `date` "--> model is not available" >> /home/output/debug.log
    else
        touch /home/model/SYNC.LCK
        rm -rf /home/output/*.csv

        # run co-simulation
        mkdir /home/evaluate
        cd /home/evaluate
        cp /home/model/cosim-model.zip .
        unzip cosim-model.zip
        java -jar /home/cosim/coe-1.0.10-jar-with-dependencies.jar --configuration cosim.json --oneshot --starttime 0.0 --endtime 20.0 1>>/home/output/debug.log 2>&1
        cp output.csv /home/output/ || true
        cat coe.log >> /home/output/coe.log

        # clean up
        cd /home
        rm -rf /home/evaluate
        rm output/SYNC.LCK || true
    fi
done
