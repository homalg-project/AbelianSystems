##    From: 	Alban Quadrat <alban.quadrat@inria.fr>
## Subject: 	Example
##    Date: 	26. Januar 2011 23:02:26 MEZ
##      To: 	Mohamed Barakat <mohamed.barakat@rwth-aachen.de>

LoadPackage( "RingsForHomalg" );

Q2 := HomalgFieldOfRationalsInDefaultCAS( ) * "x1..4";
A2 := RingOfDerivations( Q2, "d1..4" );

R2 := HomalgMatrix( "[ \
(x4^2-x3^2)*d1+(x1*x3-x2*x4)*d3+(x2*x3-x1*x4)*d4, \
(x4^2-x3^2)*d2+(x2*x3-x1*x4)*d3+(x1*x3-x2*x4)*d4 \
]", 2, 1, A2 );

LoadPackage( "Modules" );

M2 := LeftPresentation( R2 );

LoadPackage( "AbelianSystems" );

filt2 := PurityFiltrationViaAuslanderDuals( M2 );

m2 := IsomorphismOfFiltration( filt2 );

Display( filt2 );
