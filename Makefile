FC = $(fortran_compiler)
FFLAGS = $(fortran_flags)
FCINCLUDES = $(shell nc-config --fflags)
FCLIBS = $(shell nc-config --flibs)

all:
	( cd src; $(MAKE) FC="$(FC)" FFLAGS="$(FFLAGS)" FCINCLUDES="$(FCINCLUDES)" FCLIBS="$(FCLIBS)" )
	if [ -e src/convert_mpas ] ; then \
	   ( cp src/convert_mpas . ) \
	fi;
clean:
	( cd src; $(MAKE) clean )
	rm -f convert_mpas
