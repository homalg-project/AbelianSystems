Read( "Coupling.g" );

LoadPackage( "D-Modules" );

SetAsOriginalPresentation( N );

F := InjectiveLeftModule( A3 );

LoadPackage( "AbelianSystems" );

##
InstallMethod( PurityFiltration,
        "for homalg static objects",
        [ IsStaticFinitelyPresentedObjectRep ],
        
  PurityFiltrationViaAuslanderDuals );

