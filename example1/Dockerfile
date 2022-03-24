FROM openjdk:13

RUN mkdir /home/cosim && \
  yum install -y curl wget zip unzip && \
  cd /home/cosim && \
  wget https://github.com/INTO-CPS-Association/maestro/releases/download/Manual-Release%2F2.2.0/maestro-2.2.0-jar-with-dependencies.jar

COPY entrypoint.sh /home/cosim/entrypoint.sh
CMD [ "bash /home/cosim/entrypoint.sh" ]
