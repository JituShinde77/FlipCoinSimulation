echo "Welcome Flip Coin Simulation"

read -p "Enter the number of times you want to flip the coin: " num
HEAD='H'
TAIL='T'
declare -A coinDictionary
declare -A coinperDict
declare -a coinArray

function getResult()
{
	local result=''
	for (( i=0; i<2; i++ ))
	do
		coin=$(( RANDOM%2 ))
		if [ $coin -eq 0 ]
		then
			result="${result}${HEAD}"
		elif [ $coin -eq 1 ]
		then
			result="${result}${TAIL}"
		fi
	done
	echo $result
}


for (( i=0; i<num; i++ ))
do
	result=$( getResult )
	if [[ ${coinDictionary[$result]} ]]
	then
		count=${coinDictionary[$result]}
		coinDictionary[$result]=$(( ++count ))
	else
		coinDictionary[$result]=1
	fi
done
echo "Keys:  "${!coinDictionary[@]}
echo "Values: "${coinDictionary[@]}

# Create a array from Dictionary values
cnt=0
for key in ${!coinDictionary[@]}
do
	coinArray[$((cnt++))]=${coinDictionary[$key]}
	per=`echo ${coinDictionary[$key]} $num | awk '{print ($1/$2)*100}'`
	coinperDict[$key]=$per
done

echo "Percent Dictonary: "${coinperDict[@]}
