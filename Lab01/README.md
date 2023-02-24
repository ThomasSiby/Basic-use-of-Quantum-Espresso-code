##-- Structure optimization --##

There are two types of structural optimization calculations in Quantum espresso: 
(1) relax: where only the atomic positions are allowed to vary, and 
(2) vc-relax: which allows to vary both the atomic positions and lattice constants.

Before starting this, let us have a look at the various important parameters for the 
self consistent calculation (solves the Kohn-Sham equation self-consistently) via an input file.

In QE input files, there are NAMELISTS and INPUT_CARDS. 
NAMELISTS variables have default values, and should be provided a new value as required by specific calculation.
The variables can be declared in any specific order.

On the other hand, the variables in the INPUT_CARDS have always to be specified and in specific order. 
Logically independent INPUT_CARDS may be organized in any order.

There are three mandatory NAMELISTS in PWscf: 
(1) &CONTROL: specifies the flux of computation, \
(2) &SYSTEM: specifies the system, and \
(3) &ELECTRONS: specifies the algorithms used to solve the Kohn-Sham equation. 

There are two other NAMELISTS: &IONS and &CELLS, which need to be specified depending on the calculation.

The input files are typically named with a prefix .in. \
The inputs are organized as &namelists followed by their fields or cards. \
The &control, &system, and &electrons namelists are required. 

There are also optional &cell and &ions, you must provide them if your calculation require them. \
Most variables in the namelists have certain default values (which may or may not fit your needs), \
however some variables you must always provide. Comment lines can be added with lines starting with a ! like in Fortran.
