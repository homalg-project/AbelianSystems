Read( "Coupling.g" );

LoadPackage( "AbelianSystems" );

filt := PurityFiltrationViaAuslanderDuals( N );

m := IsomorphismOfFiltration( filt );

Display( TimeToString( homalgTime( A3 ) ) );
