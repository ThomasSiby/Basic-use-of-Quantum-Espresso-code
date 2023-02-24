###-- Unit conversions --###

1 Bohr = 0.529177249 Å
1 Rydberg (Ry) = 13.6056981 eV.

 ---------------***********---------------------
https://www.quantum-espresso.org/Doc/INPUT_PW.html
 ---------------***********---------------------

There are three mandatory NAMELISTS in PWscf: 
(1) &CONTROL: specifies the flux of computation, 
(2) &SYSTEM: specifies the system, and 
(3) &ELECTRONS: specifies the algorithms used to solve the Kohn-Sham equation. 
There are two other NAMELISTS: &IONS and &CELLS, which need to be specified depending on the calculation.

 &CONTROL
    ! This section is used to control the calculation we want to do, such as
    ! change the calculation type, the level of output, the directory where
    ! output is stored, etc.
    !
    ! We can accept most defaults to start with.
    !
    ! For example the default type of calculation is 'scf' which is what we
    ! want.
    ! The only thing we'll set is the parameter that says it should look in
    ! the same directory where you run the code for the pseudopotential file.
    pseudo_dir = '.'
 /

 &SYSTEM
    ! There are a number of required input variables in the "system" section.

    ! This is the index of the type of Bravais-lattice we have. 2 is for fcc.
    ! This tells the code what parameters need to be specified for the
    ! lattice.
    ibrav = 2

    ! This is the lattice length, which is the only free parameter for fcc.
    ! A is in Angstrom. We've taken the experimental value here.
    A = 3.567

    ! This is the number of atoms in the cell. For the fcc cell there are 2.
    nat = 2

    ! This is the number of types of atoms. We only have carbon so this is 1.
    ntyp = 1

    ! This is the planewave energy cutoff in Rydberg
    ecutwfc = 18.0
 /

 &ELECTRONS
    ! This section is used to set how the electronic calculations converge for
    ! self-consistent calculations.
    !
    ! Again we can accept all defaults.
    !
    ! Here we could, for example, set a lower convergence threshold for when
    ! the code decides the self-consistent calculation is converged. Or
    ! increase the maximum number of iterations.
 /

#In this section we list all the atomic species, so we need to have as many entries as 'ntyp' above. These should be entered one per line, with the atomic symbol, followed by the mass (only used for certain types of calculations), followed by the name of the pseudopotential. In the same directory as the input file we have a symbolic link to the pseudotential file we need. This saves us from making multiple copies of the same file for different calculations.

ATOMIC_SPECIES
 C  12.011  C.pz-vbc.UPF

#Now we list the postitions of all the atoms. There are several possible ways to do this. Here we use the 'crystal' option, which specifies that they are given in fractional coordinates along each of the crystal axes. There should be one line for each atom in the cell - so 'nat' lines in total.

ATOMIC_POSITIONS crystal
 C 0.00 0.00 0.00 \
 C 0.25 0.25 0.25

#Finally we specify the k-point sampling to use. Again there are several options. Here we use automatic, which allows use to easily specify a regular 4x4x4 grid of points along the crystal axes. The next three numbers specify whether to offset the grid by half a lattice spacing our not. Often convergence is a little better if you do this, but it varies.

K_POINTS automatic \
  4 4 4 1 1 1
