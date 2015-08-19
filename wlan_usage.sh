counter=0
temp=1
for line in $(cat /proc/net/netlink) 
do
counter=$((counter+1))
tmp=$((counter%10));
if [ $tmp -eq 3 ]; then
        exec 5>&1
	result="$(ps -p $line -o comm= 2>/dev/null|tee >(cat - >&5))"
	if [ $result ]; then
		#sonresult="${sonresult}${result}\n"
		a=$(echo $result | xargs whereis)
		echo $a;
		prpath="${prpath}\n"
	fi
fi
done


echo -e $prpath

