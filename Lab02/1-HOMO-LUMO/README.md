In this scf calculation, if you check the output file Si_scf.out, you will find: 
highest occupied, lowest unoccupied level (ev): 6.2414 6.9732. 
Therefore, the bandgap is 0.7318 eV, which is an underestimation of actual bandgap (1.12 eV).

#--TIPS ON CONVERGENCE--#

1) Reduce mixing_beta value, especially if there is an oscillation around the convergence energy.

2) If it is metallic system, use smearing and degauss. 
In this case, the SCF accuracy gradually goes down then suddenly increases (due to slight change in Fermi energy highest occupied / lowest unoccupied levels change).

3) Increase energy and charge density cutoffs (make sure they are sufficient).

4) Certain pseudo potential files have issues, you may try with pseudo potentials from different libraries.

Suggested values for the conv_thr: for energy and eigenvalues (scf calculation) 1.0d-7, for forces (relax calculation) 1.0d-8, 
for stress (vc-relax calculation) 1.0d-9 Ry. For certain calculation convergence might be very slow for the first iteration, 
one can start the calculation with a higher threshold, after few iterations reduce it and restart the calculation.