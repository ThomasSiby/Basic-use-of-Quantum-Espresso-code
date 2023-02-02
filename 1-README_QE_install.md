
###-- Quantum Espresso installation ---###

We can install Quantum Espresso in our personal laptops or desktops 
to run relatively less computationally intensive calculations. 
If we intend to perform computationally heavy tasks, we would need 
access to better computing resources with large number of CPU 
(or GPU) cores, memory, bandwidth, and disc IO.

Throughout our lecture, we will use oue server Quantis (https://guacamole.nano.ei.tum.de/#/)
for the calculations. 

---------------***********---------------------
###--Additional Notes for Ubuntu users --###
---------------***********---------------------

Perhaps the most easiest way to install Quantum Espresso is from the package manager 
of respective Linux distribution. This should work fine for us and this is recommended option. 
Following commands are for Ubuntu / Debian. First make sure your system is up-to-date.

sudo apt update && sudo apt upgrade

Install Quantum Espresso from apt repository:

sudo apt install --no-install-recommends \
    libfftw3-dev \
    quantum-espresso

If you want to compile from the source yourself, here are the installation steps for latest version 
of Quantum Espresso (7.1) in a Ubuntu (LTS 22.04) machine using a single processor (Serial Processing). 
First install the recommended libraries and dependencies:

sudo apt install --no-install-recommends \
    build-essential \
    ca-certificates \
    libblas3 \
    libc6 \
    libfftw3-dev \
    libgcc-s1 \
    gfortran \
    liblapack-dev \
    wget

If you want to compile for parallel processing, you need to also install:

sudo apt install --no-install-recommends \
    libopenmpi-dev \
    libscalapack-openmpi-dev \
    libelpa17  #  use libelpa4 on Ubuntu 20.04

Download Quantum Espresso (latest version 7.1 at the time of writing):

wget https://gitlab.com/QEF/q-e/-/archive/qe-7.1/q-e-qe-7.1.tar.gz

Un-tar the source files:

tar -zxvf q-e-qe-7.1.tar.gz

Go to the qe directory and issue configure:

cd q-e-qe-7.1
./configure

Here you can provide various configuration options. Read the manual in oder to properly understand. 
But in most cases you will be just fine with the defaults, it should detect the system configuration 
automatically, in case you don't get what you want, try the various configuration flags with configure.

Finally, compile the source files and create the binary executables:

# compile individual packages
make pw
# or compile everything
make all
# we can parallelize e.g., below command uses 4 CPUs
make -j4 all

Now, the binary files or their symbolic links (shortcuts) would be placed in the bin directory. 
It would be good idea to include the executable path to your .bashrc (or .zshrc or whatever shell you use) file:

# use the correct path if it differs from mine
echo 'export PATH="/root/q-e-qe-7.1/bin:$PATH"' >> ~/.bashrc

Finally, you may need to restart your terminal or source .bashrc.

source ~/.bashrc

You can compile the documentation by going to particular directory (e.g., PW or PP) and execute 
(you need to have LaTeX installed in your system):

make doc

If you want docs in PDF format, you can use latex commands to create them as well:

pdflatex filename.tex

We are now ready to run Quantum Espresso pw.x (or any other program) using mpirun by following command:

pw.x -inp inputfile > outputfile
# For parallel version
mpirun -np 12 pw.x -inp inputfile > outputfile

Where -np 12 specifies the number of processors. -inp stands for input file. 
Alternatively, we can use -i, or -in, or -input, or even standard input redirect <. 
But beware some systems may not interpret all the different options, I think safe option is to use -i.

Once installation is completed, optionally we can run tests if everything went OK. 
Go to the test-suite directory and run:

make run-tests

If all is well, we will see Passed messages and we are good to go.


#---------Installing PWTK---------#

We will install a very hand scripting package PWscf Toolkit (PWTK). First we need to install following dependencies:

sudo apt install tcl tcllib

Download the file from - http://pwtk.ijs.si/download/pwtk-2.0.tar.gz

wget "http://pwtk.ijs.si/download/pwtk-2.0.tar.gz"

Above command will download and save the file to your current directory. Next we need to just un-tar (no need to compile):

tar zxvf pwtk-2.0.tar.gz

Add the path (modify below as appropriate) to .bashrc:

echo 'export PATH="/root/pwtk-2.0:$PATH"' >> ~/.bashrc
source ~/.bashrc

---------------***********---------------------
