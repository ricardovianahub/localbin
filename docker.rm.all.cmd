docker ps -aq | awk '{system("docker rm -f " $0)}' && docker ps -a
