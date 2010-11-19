##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "AbelianSystems" );

LoadPackage( "GAPDoc" );

list := [
         "../gap/AbelianSystems.gd",
         "../gap/AbelianSystems.gi",
         "../gap/PurityViaAuslanderDuals.gd",
         "../gap/PurityViaAuslanderDuals.gi",
         ];

size := SizeScreen( );
SizeScreen([80]);

TestManualExamples( DirectoriesPackageLibrary( "AbelianSystems", "doc" )[1]![1], "AbelianSystems.xml", list );

GAPDocManualLab( "AbelianSystems" );

SizeScreen( size );

quit;
