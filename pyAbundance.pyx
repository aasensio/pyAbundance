from numpy cimport ndarray as ar
from numpy import empty, ascontiguousarray
import numpy as np

cdef extern:
	void c_init()
	void c_getmolecules(char* c_string, int* which)
	void c_abundance(int *nT, double *T, double *Pg, double *abunOut)

def init():

	c_init()
	
	return
	
	
def getMolecules():
	cdef:		
		char* c_string = '                '
		int which
		bytes py_string
	
	names = []
	
	for which in range(1,273):
		c_getmolecules(c_string, &which)		
		pystring = <bytes> c_string
		out = pystring.split()[0].split('/')
		molName = out[0].replace("_", "")
		molName = molName.replace("1", "")
		if (out[1] == '00'):
			molName += ''
		elif (out[1] == '10'):
			molName += '+'
		names.append(molName)
	
	return names

	
def abundance(ar[double,ndim=1] T, ar[double,ndim=1] Pg):	
	cdef:
		int nT = T.size
		ar[double,ndim=2] abunOut = empty((273,nT), order='F')
	
	molNames = getMolecules()
	
	c_abundance(&nT, &T[0], &Pg[0], <double*> abunOut.data)
			
	out = {}
	loop = 0
	for name in molNames:		
		out[name] = abunOut[loop,:]
		loop += 1				
	
	return out