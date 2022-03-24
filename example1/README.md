# First Example

## Build Instructions
sudo docker build -t maestro-openjdk13:v2.2.0 .
sudo docker tag maestro-openjdk13:v2.2.0 maestro-openjdk13:latest

sudo docker login -u prasadtalasila --password-stdin
sudo docker push -a prasadtalasila/maestro-openjdk13

## Run the example

1. Create two directories
    * model - keep cosim-model.zip file in this directory
    * output - the output files and logs will be stored here
2. Execute the docker run command
    `sudo docker run --entrypoint '/home/cosim/entrypoint.sh' --name maestro-openjdk13-run --volume "$PWD/model:/home/model" --volume "$PWD/output:/home/output" maestro-openjdk13`
