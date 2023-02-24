#------Band Structure calculation------#

Before we can run bands calculation, we need to perform single-point self consistent field calculation. 

1) Run the scf calculation usimg pw.x.

pw.x < Si_scf.in > si_scf.out

After the scf calculation, copy the 1-scf as 2-bands.

Next step is our band calculation (non-self consistent field) calculation. 
The bands calculation is non self-consistent in the sense that it uses the ground state electron density, 
Hartree, exchange and correlation potentials determined in the previous step. 
In case of non self-consistent calculation, the pw.x program determines the Kohn-Sham eigenfunction 
and eigenvalues without updating Kohn-Sham Hamiltonian at every iteration. 
We need to specify the k-points for which we want to calculate the eigenvalues. We can also specify nbnd.

2) Then, again run pw.x for bands calculation:

pw.x < Si_bands.in > Si_bands.out

The bands are now calculated. We need some post processing in order to obtain the data in more usable manner. 
Input file for thye post processing is bands.x

3) Run bands.x from post processing (PP) module. Then we have to specify:

bands.x < Si_bands_pp.in > Si_bands_pp.out

4) Then, plotband.x

Input file > Si_bands.dat (name)
Emin, Emax > -6, 16
output file (gnuplot/xmgr) > Si_bands.gnuplot
output file (ps) > Si_bands.ps
Efermi > 6.6416
deltaE, reference E (for tics) 4, 0


You will have si_bands.ps with band diagram. Or you can use your favorite plotting program (Python, etc.)to make plots.

The k values for high symmetry points can be found in the output file (si_bands_pp.out).
