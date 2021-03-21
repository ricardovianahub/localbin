docker ps -a | awk '{if ( (index($0, " Up ") == 0) && ($1 != "CONTAINER") ) { print "DELETING ==> " $0; system("docker rm " $1)} }'

