##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/AbelianSystems.bib" );
WriteBibXMLextFile( "doc/AbelianSystemsBib.xml", bib );

Read( "ListOfDocFiles.g" );

PrintTo( "VERSION", PackageInfo( "AbelianSystems" )[1].Version );

MakeGAPDocDoc( "doc", "AbelianSystems", list, "AbelianSystems" );

GAPDocManualLab( "AbelianSystems" );

quit;
