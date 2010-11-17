LoadPackage( "homalg" );

DeclareGlobalFunction( "PurityFiltrationViaAuslanderDuals" );

InstallGlobalFunction( PurityFiltrationViaAuslanderDuals,
  function( M )
    local O, F, Dualize, HF, N, n, PN, vert, cm, defs, eta, epsilon,
          phi, prefilt, degrees, purity_telescope, purity;
      
    O := StructureObject( M );
    
    F := ShortenResolution( M );
    
    Dualize := Hom;
    
    HF := Dualize( F );
    
    N := List( [ 0 .. HighestDegree( HF ) - 1 ], i -> Cokernel( CertainMorphism( HF, i ) ) );
    
    n := Length( N );
    
    PN := List( [ 1 .. n ], i -> ShortenResolution( i + 1, N[i] ) );
    
    Perform( [ 1 .. n ], i -> Resolution( i + 1, N[i] ) );
    
    vert := List( [ 1 .. n - 1 ], j -> PreCompose( CokernelEpi( FirstMorphismOfResolution( N[j] ) ) / CokernelEpi( CertainMorphism( HF, j - 1 ) ), PreCompose( CertainMorphism( HF, j) , CokernelEpi( CertainMorphism( HF, j ) ) / CokernelEpi( FirstMorphismOfResolution( N[j + 1] ) ) ) / FirstMorphismOfResolution( N[j + 1] ) ) );
    
    cm := List( [ 1 .. n - 1 ], j -> HomalgChainMap( vert[j], PN[j], PN[j + 1], [ 0, 1 ] ) );
    
    Perform( cm, CompleteChainMap );
    
    Assert( 1, ForAll( cm, IsMorphism ) );
    
    Perform( cm, function( m ) SetIsMorphism( m, true ); end );
    
    cm := List( cm, Dualize );
    
    defs := List( [ 1 .. n - 1 ], j -> DefectOfExactness( cm[j], j + 1 ) );
    
    eta := Dualize( PreCompose( CertainMorphism( HF, 0 ), CokernelEpi( CertainMorphism( HF, 0 ) ) / CokernelEpi( FirstMorphismOfResolution( N[1] ) ) ) / FirstMorphismOfResolution( N[1] ) );
    
    epsilon := NatTrIdToHomHom_R( HullObjectInResolution( M ) );
    
    phi := PreCompose( PreCompose( NaturalGeneralizedEmbedding( Range( defs[1] ) ), eta ) / epsilon, FreeHullEpi( M ) );
    
    Assert( 1, IsMorphism( phi ) );
    
    SetIsMorphism( phi, true );
    
    prefilt := [ TheIdentityMorphism( M ), phi ];
    
    Append( prefilt, defs );
    
    degrees := [ -n .. 0 ];
    
    purity_telescope := rec( telescope := true, degrees := degrees );
    
    Perform( degrees, function( c ) purity_telescope.(String( c )) := prefilt[-c + 1]; end );
    
    purity := HomalgAscendingFiltration( purity_telescope );
    
    SetIsPurityFiltration( purity, true );
    
    SetAttributesByPurityFiltration( purity );
    
    SetPurityFiltration( M, purity );
    
    return purity;
    
end );
