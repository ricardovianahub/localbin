docker images | awk '{if ($2=="<none>") {print "Removing " $1 " " $2; system("docker rmi " $3)}}'
docker images
