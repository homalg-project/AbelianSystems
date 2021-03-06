## This file is automatically generated
## Standard maketest.g for the homalg project

LoadPackage( "Modules" );
LoadPackage( "SystemTheory" );
LoadPackage( "IO_ForHomalg" );
HOMALG_IO.show_banners := false;
HOMALG_IO.use_common_stream := true;
LoadPackage( "AbelianSystems" );
Read( "ListOfDocFiles.g" );
example_tree := ExtractExamples( DirectoriesPackageLibrary( "AbelianSystems", "doc" )[1]![1], "AbelianSystems.xml", list, 500 );
RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );
GAPDocManualLab( "AbelianSystems" );
QUIT;
