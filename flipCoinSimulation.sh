echo "Welcome Flip Coin Simulation"
read -p "Enter the number of times you want to flip the coin: " num
echo "Enter "
echo "1)Singlet"
echo "2)Doublet"
echo "3)Triplet"
read -p "Enter Your Choice: " choice

HEAD='H'
TAIL='T'
declare -A coinDictionary
declare -A coinperDict
declare -a coinArray

# Function return the result of flips
function getResult()
{
	local result=''
	for (( i=0; i<$1; i++ ))
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

# Store the result of flip into dictiory
for (( i=0; i<num; i++ ))
do
	result=$( getResult $choice )
	if [[ ${coinDictionary[$result]} ]]
	then
		count=${coinDictionary[$result]}
		coinDictionary[$result]=$(( ++count ))
	else
		coinDictionary[$result]=1
	fi
done
#Show the result
echo "Keys:  "${!coinDictionary[@]}
echo "Values: "${coinDictionary[@]}

# Create a array from Dictionary values and percentage of dictionary values
cnt=0
for key in ${!coinDictionary[@]}
do
	coinArray[$((cnt++))]=${coinDictionary[$key]}
	per=`echo ${coinDictionary[$key]} $num | awk '{print ($1/$2)*100}'`
	coinperDict[$key]=$per
done

# Find out the maximum values
max=${coinArray[0]}
len="${#coinArray[@]}"
for (( i=1; i<$len; i++ ))
do
        if [[ ${coinArray[$i]} -gt $max ]]
        then
                max=${coinArray[$i]}
        fi
done

#Show the maximum flip with percentage
for key in ${!coinDictionary[@]}
do
        if [[ ${coinDictionary[$key]} -eq $max ]]
        then
                percent=`echo $max $num | awk '{print ($1/$2)*100}'`	
                echo $key":"$percent"%"
                exit 1
        fi
done
