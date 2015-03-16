import pychem
import numpy as np
import matplotlib.pyplot as pl

pychem.init()
res = pychem.getMolecules()

T = np.linspace(6000.,8000., 50)
Pg = 1.e17 * 1.381e-16 * T

out = pychem.abundance(T, Pg)

pl.plot(T, out['CO'])
pl.plot(T, out['CH'])