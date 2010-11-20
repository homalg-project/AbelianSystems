LoadPackage( "RingsForHomalg" );

Qxyz := HomalgFieldOfRationalsInDefaultCAS( ) * "x,y,z";

mat := HomalgMatrix( "[ \
x*y+x*z+y*z, \
x^2+y, \
y*z+2, \
x*y-1, \
y+z \
]", 5, 1, Qxyz );

LoadPackage( "Modules" );

M := LeftPresentation( mat );

LoadPackage( "AbelianSystems" );

filt := PurityFiltrationViaAuslanderDuals( M );

m := IsomorphismOfFiltration( filt );

Display( TimeToString( homalgTime( Qxyz ) ) );
