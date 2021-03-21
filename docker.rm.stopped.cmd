docker ps -a | awk '{if ($1!="CONTAINER") if(index($0," Up ")==0) { print "DELETING ==> " $0; system("docker rm " $1)} }' && docker ps -a

