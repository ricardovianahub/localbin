docker images | awk '{if ($1 != "REPOSITORY") {print "Removing " $1 " " $2; system("docker rmi " $3)}}' && docker images
