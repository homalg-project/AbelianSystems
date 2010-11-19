LoadPackage( "RingsForHomalg" );

Qt := HomalgFieldOfRationalsInSingular( ) * "t";

A1 := RingOfDerivations( Qt, "Dt" );

M := HomalgMatrix( "[ \
t^2, \
t * Dt + 2 \
]", 2, 1, A1 );

LoadPackage( "Modules" );

M := LeftPresentation( M );

LoadPackage( "AbelianSystems" );

