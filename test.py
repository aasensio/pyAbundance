import pyAbundance as pa
import numpy as np
import matplotlib.pyplot as pl

pa.init()
res = pa.getMolecules()

T = np.linspace(6000.,8000., 50)
Pg = 1.e17 * 1.381e-16 * T

out = pa.abundance(T, Pg)

pl.plot(T, out['CO'])
pl.plot(T, out['CH'])
