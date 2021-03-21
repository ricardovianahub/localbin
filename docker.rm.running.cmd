docker ps -q | awk '{system("docker rm -f " $1)}' && docker ps

