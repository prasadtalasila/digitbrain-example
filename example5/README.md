# First Example

This example is to run the Mass spring damper example on Maestro v1. Maestro v1 container shall run in the job mode.

## Build Instructions
```
sudo docker build -t maestro11-openjdk13:v1.0.10 .
sudo docker tag maestro11-openjdk13:v1.0.10 maestro11-openjdk13:latest

sudo docker login -u prasadtalasila --password-stdin
sudo docker push -a prasadtalasila/maestro11-openjdk13
```

## Run the example

1. Note on the directories
    * input - keep input files in this directory
    * model - cosim-model.zip downloaded by the docker-compose. This URL can be changed in docker-compose.yaml file.
    * output - the output files and logs will be stored here
2. If you have docker-compose installed, you can try    
    `sudo docker-compose up` and    
    `sudo docker-compose down`
