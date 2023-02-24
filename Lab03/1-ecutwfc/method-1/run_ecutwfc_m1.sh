#!/bin/bash

template="Si_scf.in"
repstr="xxxx"

for val in {10..50..5}
do
  inp="Si_${val}.in"
  sed "s/$repstr/$val/" $template > $inp
  pw.x < $inp &> ${inp%.*}.out
done

awk '/kinetic-energy/{ecut=$4}
     /^!.*total/{print ecut, $5}' *out > etot_v_ecut_m1.dat
