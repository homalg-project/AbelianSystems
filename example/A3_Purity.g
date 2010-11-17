Read( "../gap/PurityViaAuslanderDuals.g" );

Read( "Coupling.g" );

filt := PurityFiltrationViaAuslanderDuals( N );

m := IsomorphismOfFiltration( filt );

Display( TimeToString( homalgTime( A3 ) ) );
