# First Example

## Build Instructions
```
bash docker-build.sh
```

## Run the example

1. Note on the directories
    * input - keep input files in this directory
    * model - keep cosim-model.zip file in this directory; you can update the simulation start and endtimes in cosim-model/time.json
    * output - the output files and logs will be stored here
2. Execute the docker run command    
    `sudo docker run --entrypoint '/home/cosim/entrypoint.sh' --name maestro1-openjdk13-run --volume "$PWD/input:/home/input" --volume "$PWD/model:/home/model" --volume "$PWD/output:/home/output" maestro1-service-openjdk13`
3. If you have docker-compose installed, you can try    
    `sudo docker-compose up` and    
    `sudo docker-compose down`
