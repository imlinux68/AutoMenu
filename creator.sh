#! /bin/bash

function make_env() {
	num=0
    $(mkdir $1/)
	echo -e "#!/bin/bash\n\n\n" > $1/main.sh
    for (( i=1; i<=$2; i++ ))
    do
        $(touch $1/script$i.sh)
		$(echo "source script$i.sh" >> $1/main.sh)
cat <<< ' #!/bin/bash
function  () {
	
}' > $1/script$i.sh
    done
	cat <<<'
function main () {
while :
	do
		echo -e "\n\n\n***************************"
		echo          "***************************"
		echo          "MAKE YOUR CHOISE RIGHT NOW!"
		echo          "***************************"
		echo          "***************************"
' >> $1/main.sh

lum=1
for (( i=1; i<=$2; i++ ))
    do
		
		echo -e "\t\t\t echo \"$i.  script\"" >> $1/main.sh
		let lum=lum+1
	done
	echo -e "\t\t\t echo \"$lum. Quit\"" >> $1/main.sh
cat <<<'
		read -p "Take your choice: " choice
		case $choice in
 ' >> $1/main.sh
	jum=1
	for (( j=1; j<=$2; j++ ))
    do
		echo -e "\t\t\t$j)  ;;" >> $1/main.sh
		let jum=jum+1
	done
	echo -e "\t\t\t$jum) break ;;" >> $1/main.sh
	echo -ne "\t\t\t*) " >> $1/main.sh
	echo -ne 'echo "Nums from ' >> $1/main.sh
	echo -ne "1 to $(( $2 +1 )) ONLY\" ;" >> $1/main.sh
	echo  " sleep 3 ;;" >> $1/main.sh
	echo -e "\t\tesac" >> $1/main.sh
	echo -e "\tdone" >> $1/main.sh
	echo '}' >> $1/main.sh
	echo 'main' >> $1/main.sh
    	$(chmod -R a+x $1)

}


read -rp "Please enter assignment name: " assign_name
read -rp "Please enter number of scripts for assignment: " num

make_env "$assign_name" $num
