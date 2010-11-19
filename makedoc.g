##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/AbelianSystems.bib" );
WriteBibXMLextFile( "doc/AbelianSystemsBib.xml", bib );

list := [
         "../gap/AbelianSystems.gd",
         "../gap/AbelianSystems.gi",
         "../gap/PurityViaAuslanderDuals.gd",
         "../gap/PurityViaAuslanderDuals.gi",
         ];

PrintTo( "VERSION", PackageInfo( "AbelianSystems" )[1].Version );

MakeGAPDocDoc( "doc", "AbelianSystems", list, "AbelianSystems" );

GAPDocManualLab( "AbelianSystems" );

quit;
