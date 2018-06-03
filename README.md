# matdyn calculation 
STEP ONE: put matdyn.modes(get modes and eigvector after ASR Rules) and bzo.dyn1(atom born effective charge) at the same folder as the other codes.

STEP TWO:first get the eigenvector(eigev.txt) from matdyn.molds and atom born effective charge (atomeffect.txt) by typing ./process.sh

STEP Three: run the matlab code. In the matlab code, you need to change the volume(vol variable units A^3). You need to change the mass sequence following the same as ph.in input
