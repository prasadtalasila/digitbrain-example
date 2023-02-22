FROM openjdk:13

RUN mkdir /home/cosim && \
  yum install -y curl wget zip unzip && \
  cd /home/cosim && \
  wget https://github.com/INTO-CPS-Association/maestro/releases/download/Release%2F1.0.10/coe-1.0.10-jar-with-dependencies.jar

COPY entrypoint.sh /home/cosim/entrypoint.sh
CMD [ "bash /home/cosim/entrypoint.sh" ]
