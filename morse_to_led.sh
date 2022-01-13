#!/bin/bash

declare -A morse
morse[0]='-----'
morse[1]='.----'
morse[2]='..---'
morse[3]='...--'
morse[4]='....-'
morse[5]='.....'
morse[6]='-....'
morse[7]='--...'
morse[8]='---..'
morse[9]='----.'
morse[A]='.-'
morse[B]='-...'
morse[C]='-.-.'
morse[D]='-..'
morse[E]='.'
morse[F]='..-.'
morse[G]='--.'
morse[H]='....'
morse[I]='..'
morse[J]='.---'
morse[K]='-.-'
morse[L]='.-..'
morse[M]='--'
morse[N]='-.'
morse[O]='---'
morse[P]='.--.'
morse[Q]='--.-'
morse[R]='.-.'
morse[S]='...'
morse[T]='-'
morse[U]='..-'
morse[V]='...-'
morse[W]='.--'
morse[X]='-..-'
morse[Y]='-.--'
morse[Z]='--..'
#######################################
result=''

xset -led

echo "Insert here the message"

function convert() {
	if [ $1 == "." ] 
	then
		xset led
		sleep 0.2
		xset -led
		sleep 0.5
	elif [ $1 == "-" ] 
	then
		xset led
		sleep 1
		xset -led
		sleep 0.5
	else
		sleep 0.5
	fi
}

function morse_to_led() {
	morse_string=$1
	for (( i=0; i<${#morse_string}; i++)); do
		c=${morse_string:$i:1} 2> /dev/null
		convert $c
	done

	sleep 1
	xset led
}

while read -rN1 c; do
	c=${c^}
	if [[ $c == $'\n' ]]; then
		echo $result
		morse_to_led "$result" 2> /dev/null
	else
		result="${result} ${morse[$c]}"
	fi
done
