---------------***********---------------------
###-- Crystal Structure ---###
---------------***********---------------------

Density functional theory (DFT) calculations are ab-initio meaning the calculation is done 
from the scratch based on given input parameters. We need to provide the crystal structure 
in order to calculate DFT. Crystal structures are widely available in Crystallographic Information File (.CIF) format. 
There are several databases where you can find crystal structures.

http://crystallography.net/cod/ \
https://materialsproject.org \
https://mpds.io/ \
https://icsd.fiz-karlsruhe.de/index.xhtml \
http://aflowlib.org/CrystalDatabase/ \
http://crystdb.nims.go.jp/crystdb/search-materials 

---------------***********---------------------
###-- Useful tools ---###
---------------***********---------------------

##-1) Vesta - https://jp-minerals.org/vesta/en/. 
It helps you visualize crystal structure, create and modify super cells, crystal structures and many more functionality.

##-2) cif2cell 
We can prepare our Quantum Espresso input file using cif2cell utility. 
If you do not have cif2cell installed, you can use pip to install:

sudo pip3 install cif2cell \

You may need to add it to the path in your .bashrc manually:

export PATH="/home/name/.local/lib/python3.8/site-packages/:$PATH"

Running cif2cell command:

cif2cell file.cif -p quantum-espresso -o inputfile.in

##-3) Xcrysdens

You can explore the crystal structure, find out k-path and many more using Xcrysdens application - http://www.xcrysden.org
For certain functionality, Xcrysdens requires a basic calculator program. On Ubuntu/ Debian:

sudo apt update \
sudo apt install bc xcrysden 

Manual installation:

# install dependencies
sudo apt install --no-install-recommends bc tk libglu1-mesa libtogl2 \
      libfftw3-3 libxmu6 imagemagick openbabel libgfortran5

# download the latest version of xcrysden and extract
wget http://www.xcrysden.org/download/xcrysden-1.6.2-linux_x86_64-shared.tar.gz \
tar -zxvf xcrysden-1.6.2-linux_x86_64-shared.tar.gz

# launch (provided you extracted under your home directory)
~/xcrysden-1.6.2-bin-shared/xcrysden

Note: If you are on WSL (Windows Subsystem for Linux), you need to install X-server (X-ming for Windows) 
on the host and set export DISPLAY=:0 in your WSL instance.

##-4) QE Input generator

You can generate PWscf input files using tools in this website as well https://www.materialscloud.org/work/tools/qeinputgenerator
Same website also has a tool for k-path visualization and generation https://www.materialscloud.org/work/tools/seekpath
