#------Density of States calculation------#

Before we can run the Density of States (DOS) calculation, we need

1) Perform fixed-ion self consistent filed (scf) calculation.
2) Fix the parameters and run non-self consistent field (nscf) calculation with denser k-point grid.

#-----scf calculation---------------------------------------------------------------------

Create a directory: mkdir 1-scf

We should use the lattice constant value that we obtained from the relaxation calculation. 
We should not directly use the experimental/real lattice constant value. 
Depending on the method and pseudo-potential, it might result stress in the system. 
We also have to increase the ecutwfc to have better precision. 
Then, we run the scf calculation using the command:

pw.x < Si_scf_dos.in > Si_scf_dos.out

#-----nscf calculation-----------------------------------------------------------------------

Copy the entire 1-scf directory after the compeltion of the simulation and rename it as as 2-nscf.

cp -r 1-scf 2-nscf

cd 2-nscf

cp Si_scf_dos.in Si_nscf_dos.in

Then, change:

calculation = 'nscf',
Add occupations in the &system card as tetrahedra (appropriate for DOS calculation)
Increase the number of k-points to 12 × 12 × 12 (or higher) with automatic option.
Also specify nosym = .TRUE. to avoid generation of additional k-points in low symmetry cases. 
*outdir and prefix must be same as in the scf step, some of the inputs and output are read from previous step*

Then, we run the nscf calculation using the command:

pw.x < Si_nscf_dos.in > Si_nscf_dos.out

#-----dos calculation------------------------------------------------------------------------

Now our final step is to calculate the density of states. The DOS input file as follows:

Copy the entire 2-nscf directory after the compeltion of the simulation and rename it as as 3-dos.
The input file is Si_dos.in. Then run the following command:

dos.x < Si_dos.in > Si_dos.out

After successful completion of the simulation, the DOS data is obtained from the si_dos.dat file 
that we specified in our input file. The, we can plot the DOS using python. 
----------------------------------------------------------------------------------------------------

**** Important*********
For a set of calculation, we must keep the prefix same. For example, the nscf or bands calculation uses 
the wavefunction calculated by the scf calculation. When performing different calculations, for example 
you change a parameter and want to see the changes, you must use different output folder or unique prefix 
for different calculations so that the outputs do not get mixed.

Sometimes it is important to sample the \Gamma point for DOS calculation 
(e.g., the conducting bands cross the Fermi surface only at \Gamma point). 
In such cases, we need to use odd k-grid (e.g., 9✕9✕5 or 13✕13✕13).

**** Important*********








