all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g \
		PackageInfo.g \
		doc/AbelianSystems.bib doc/*.xml \
		gap/*.gd gap/*.gi examples/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/AbelianSystems.tar.gz --exclude ".DS_Store" --exclude "*~" AbelianSystems/doc/*.* AbelianSystems/doc/clean AbelianSystems/gap/*.{gi,gd} AbelianSystems/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g} AbelianSystems/examples/*.g)

WEBPOS=public_html
WEBPOS_FINAL=~/Sites/AbelianSystems/

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.AbelianSystems
	cp doc/manual.pdf ${WEBPOS}/AbelianSystems.pdf
	cp doc/*.{css,html} ${WEBPOS}
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/AbelianSystems.tar.gz ${WEBPOS}/AbelianSystems-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s AbelianSystems-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/AbelianSystems.tar.gz
