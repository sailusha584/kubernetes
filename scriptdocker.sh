#! bin/bash
yaml_image=$(yq '.spec.template.spec.containers[].image' deployment.yaml)
latest_image=$(docker images | awk '{print $1 ":"$2}' | awk 'NR==2')
substr='nginx'
#sudo docker images --format '{{.Repository}} {{.Tag}}'| while read repo tag; do
if [[ $latest_image == *"$substr"* ]];
then
  echo "$yaml_image"
  echo "$latest_image"
  sed -i "s|${yaml_image}|${latest_image}|g" deployment.yaml
fi
#done
