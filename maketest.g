##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "AbelianSystems" );

LoadPackage( "GAPDoc" );

Read( "ListOfDocFiles.g" );

size := SizeScreen( );
SizeScreen([80]);

TestManualExamples( DirectoriesPackageLibrary( "AbelianSystems", "doc" )[1]![1], "AbelianSystems.xml", list );

GAPDocManualLab( "AbelianSystems" );

SizeScreen( size );

quit;
