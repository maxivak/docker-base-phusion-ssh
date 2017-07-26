PASS=$1

echo "root:$PASS" | chpasswd
#echo -e "$PASS\n$PASS" | passwd