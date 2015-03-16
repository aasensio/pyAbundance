# pyAbundance

Compute molecular abundances for given temperature and gas density

## Compilation
The default `makefile` is `gfortran`, which can be easily installed in any
system. Just type the following to have the code compiled. You will need
to have `numpy` and `cython` installed.

	python setup.py build_ext --inplace

## Usage

	import pyAbundance as pa
	pa.init()
	molNames = pa.getMolecules()

	T = np.linspace(6000.,8000., 50)
	Pg = 1.e17 * 1.381e-16 * T

	out = pa.abundance(T, Pg)

The output is a dictionary that can be accessed through molecule names

	out['CO']
