# First Example

This example is to run the Mass spring damper example on Maestro v1. Maestro v1 container shall run in the job mode.

## Build Instructions
```
sudo docker build -t maestro1-openjdk13:v1.0.10 .
sudo docker tag maestro1-openjdk13:v1.0.10 maestro1-openjdk13:latest

sudo docker login -u prasadtalasila --password-stdin
sudo docker push -a prasadtalasila/maestro1-openjdk13
```

## Run the example

1. Note on the directories
    * input - keep input files in this directory
    * model - keep cosim-model.zip file in this directory
    * output - the output files and logs will be stored here
2. Execute the docker run command    
    `sudo docker run --entrypoint '/home/cosim/entrypoint.sh' --name maestro1-openjdk13-run --volume "$PWD/input:/home/input" --volume "$PWD/model:/home/model" --volume "$PWD/output:/home/output" maestro11-openjdk13`
3. If you have docker-compose installed, you can try    
    `sudo docker-compose up` and    
    `sudo docker-compose down`
