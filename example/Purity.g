Read( "../gap/PurityViaAuslanderDuals.g" );

Read( "ReducedBasisOfModule.g" );

filt := PurityFiltrationViaAuslanderDuals( W );

m := IsomorphismOfFiltration( filt );

Display( TimeToString( homalgTime( Qxyz ) ) );
