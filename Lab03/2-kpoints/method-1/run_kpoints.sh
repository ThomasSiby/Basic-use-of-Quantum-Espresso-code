#!/bin/sh
NAME="kp"
for KP in 2 3 4 5 6 7 8 9 10 11 12 13 14 15
do
cat > ${NAME}_${KP}.in << EOF 

 &control
    calculation = 'scf',
    pseudo_dir = './'
    prefix = 'Si_exc1',
 /
 &system
    ibrav =  2, 
    celldm(1) = 10.26, 
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
  $KP $KP $KP 1 1 1

EOF
pw.x < ${NAME}_${KP}.in > ${NAME}_${KP}.out
echo ${NAME}_${KP}
grep ! ${NAME}_${KP}.out
done

awk '/number of k points/{nkpt=$4}
     /^!.*total/{print nkpt, $5}' *out > etot_v_kpoints.dat
