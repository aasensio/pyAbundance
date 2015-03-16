pychem: chemical.o

clean:
	find . -maxdepth 2 -name "*.o" -delete ; find . -maxdepth 1 -name "*.mod" -delete ;
	find . -maxdepth 2 -name "*~" -delete ; find . -maxdepth 2 -name "*.c" -delete ;
	find . -maxdepth 2 -name "pyAbundance.so" -delete ;
	
chemical.o: chemical.f90
	gfortran -O3 -ffree-line-length-none -fPIC -c chemical.f90
