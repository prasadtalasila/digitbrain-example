#!/bin/bash
# Download front-end PHP code and model from EGI repository
code_status=1
model_status=1

mkdir /home/download
cd /home/download

while :
do
  curl --retry 2 --insecure -H "X-Auth-Token: ${PHP_EGI_TOKEN}" "${PHP_CODE_URL}" -o html.zip
  code_status=$?
  if [ $code_status -ne 0 ]
  then 
    echo "php code is not available yet. Will try again in 60 seconds"
  fi

  curl --retry 2 --insecure -H "X-Auth-Token: ${MODEL_EGI_TOKEN}" "${MODEL_URL}" -o cosim-model.zip
  model_status=$?
  if [ $model_status -ne 0 ]
  then 
    echo "model is not available yet. Will try again in 60 seconds"
  fi

  if [ $code_status -ne 0 ] || [ $model_status -ne 0 ]
  then
    sleep 60
  else
    echo -e "\n\nphp code and model are available now. Proceeding with the model evaluation.\n\n"
    break
  fi
done

cp cosim-model.zip /home/model
cp html.zip /var/www/html
unzip html.zip -d /var/www/html
chmod -R 777 /var/www/html
chmod -R 777 /home/model
chmod -R 777 /home/input
chmod -R 777 /home/output
