echo "Welcome Flip Coin Simulation"

coin=$(( RANDOM % 2 ))


if [ $coin -eq 0 ]
then
	echo "Head"
elif [ $coin -eq 1 ]
then
	echo "Tail"
fi
