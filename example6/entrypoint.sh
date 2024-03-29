#!/bin/bash
cd /home/model
wget ${MODEL_URL}

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

        startTime=`cat time.json | jq .startTime`
        endTime=`cat time.json | jq .endTime`
        java -jar /home/cosim/coe-1.0.10-jar-with-dependencies.jar --configuration cosim.json \
            --oneshot --starttime startTime --endtime endTime 1>>/home/output/debug.log 2>&1
        cp output.csv /home/output/ || true
        cat coe.log >> /home/output/coe.log
        if [[ -f failed ]]
        then 
            mv failed /home/output/error.log
        fi

        # clean up
        cd /home
        rm -rf /home/evaluate
        rm output/SYNC.LCK || true
    fi
done
