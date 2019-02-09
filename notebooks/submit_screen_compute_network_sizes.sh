#!/bin/bash
# This corresponds to 128 training samples
export MACHINE_LEARNING_TRAINING_SIZE=2
export OMP_NUM_THREADS=1
set -e

for func in 'Lift' 'Drag';
do

    screen -S $func -dm bash -c "python3 ../python/ComputingBestNetworks.py --try_network_sizes --data_source 'Airfoils' --functional_name ${func} &> log_airfoils_${func}.txt";

done


for func in 'Q1' 'Q2' 'Q3';
do

    screen -S $func -dm bash -c "python3 ../python/ComputingBestNetworks.py --try_network_sizes --data_source 'SodShockTubeQMC' --functional_name ${func}&> log_sod_${func}.txt";
done

for func in 'Sine' 'Sine/d' 'Sine/d3';
do

    screen -S ${func//\//} -dm bash -c "python3 ../python/ComputingBestNetworks.py --try_network_sizes --data_source 'Sine' --functional_name ${func} &> log_sine_${func//\//}.txt";
done
