echo "> docker-compose up -d"
docker-compose up -d || exit 1 # [--force-recreate]
echo '> CONTAINER_ID=`docker-compose ps -q`'
CONTAINER_ID=`docker-compose ps -q`
echo "> write container id to inventory file 'docker'"
cat << EOS > docker
[default]
test ansible_host=$CONTAINER_ID
EOS
ansible-playbook -c docker -u foo -i docker test.yml || exit 1
# docker-compose stop || exit 1
# docker-compose rm
