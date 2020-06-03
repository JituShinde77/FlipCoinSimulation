echo "Welcome Flip Coin Simulation"

read -p "Enter the number of times you want to flip the coin: " num

declare -A coinDictionary

for (( i=0; i<num; i++ ))
do
	coin=$(( RANDOM%2 ))

	if [ $coin -eq 0 ]
	then
		if [ ${coinDictionary['H']} ]
		then 
			count=${coinDictionary['H']}
			coinDictionary['H']=$(( ++count ))
		else
			coinDictionary['H']=1
		fi
	elif [ $coin -eq 1 ]
	then
		if [ ${coinDictionary['T']} ]
                then
                        count=${coinDictionary['T']}
                        coinDictionary['T']=$(( ++count ))
                else
                        coinDictionary['T']=1
		fi
	fi

done

echo ${!coinDictionary[@]}
echo ${coinDictionary[@]}

if [ ${coinDictionary['H']} -gt ${coinDictionary['T']} ]
then
	percentage=`echo ${coinDictionary['H']} $num | awk '{print ($1/$2)*100}'`
	echo "H:"$percentage"%"
elif [ ${coinDictionary['T']} -gt ${coinDictionary['H']} ]
then
        percentage=`echo ${coinDictionary['T']} $num | awk '{print ($1/$2)*100}'`
        echo "T:"$percentage"%"
else
	percentage=`echo ${coinDictionary['H']} $num | awk '{print ($1/$2)*100}'`
        echo "T:"$percentage"%"
fi
