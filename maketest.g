##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "Modules" );

LoadPackage( "SystemTheory" );

LoadPackage( "IO_ForHomalg" );

HOMALG_IO.show_banners := false;
HOMALG_IO.use_common_stream := true;

LoadPackage( "GAPDoc" );

Read( "ListOfDocFiles.g" );

size := SizeScreen( );
SizeScreen([80]);

TestManualExamples( DirectoriesPackageLibrary( "AbelianSystems", "doc" )[1]![1], "AbelianSystems.xml", list );

GAPDocManualLab( "AbelianSystems" );

SizeScreen( size );

quit;
