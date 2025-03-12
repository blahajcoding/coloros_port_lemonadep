#!/bin/bash
device_code=$1
case $device_code in
	OnePlus9Pro) size=11190403072;;
	OnePlus9R) size=9932111872;;
	OnePlus8T) size=7516192768;;
	#Oppo find x3
	OP4E5D) size=11190403072;;
	# Oplus ACE3V
	 OP5CFBL1) size=16106127360;; 
    #OP5CFBL1) size=16105078784;;
	#Others
	*) size=11811160064;;
esac
echo $size
