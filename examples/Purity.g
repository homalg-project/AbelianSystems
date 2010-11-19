Read( "ReducedBasisOfModule.g" );

LoadPackage( "AbelianSystems" );

filt := PurityFiltrationViaAuslanderDuals( W );

m := IsomorphismOfFiltration( filt );

Display( TimeToString( homalgTime( Qxyz ) ) );
