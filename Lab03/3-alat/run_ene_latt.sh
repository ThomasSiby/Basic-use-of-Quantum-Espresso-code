#!/bin/sh
NAME="alat"
for LAT in  9.0 9.2 9.4 9.6 9.8 10.0 10.2 10.4 10.6 10.8 11.0 11.2 11.4
do
cat > ${NAME}_${LAT}.in << EOF 

 &control
    calculation = 'scf',
    pseudo_dir = './'
    prefix = 'Si_exc1',
 /
 &system
    ibrav =  2, 
    celldm(1) = $LAT, 
    nat =  2, 
    ntyp = 1,
    ecutwfc = 25
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 Si 28.086  Si.pbe-rrkj.UPF

ATOMIC_POSITIONS (alat)
 Si 0.0 0.0 0.0
 Si 0.25 0.25 0.25

K_POINTS (automatic)
  6 6 6 1 1 1

EOF
pw.x < ${NAME}_${LAT}.in > ${NAME}_${LAT}.out
echo ${NAME}_${LAT}
grep ! ${NAME}_${LAT}.out
done

awk '/Crystallographic-constants/{alat=$4}
     /^!.*total/{print alat, $5}' *out > etot_v_alat.dat
