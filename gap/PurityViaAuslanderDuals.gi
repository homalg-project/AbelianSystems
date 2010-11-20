InstallGlobalFunction( PurityFiltrationViaAuslanderDuals,
  function( arg )
    local nargs, q, M, FM, HF, N, n, PN, vert, cm, t, defs, eta, epsilon,
          phi, prefilt, degrees, purity_telescope, purity;
    
    nargs := Length( arg );
    
    if nargs > 1 then
        q := arg[1];
    else
        q := -1;
    fi;
    
    M := arg[nargs];
    
    FM := Resolution( q, M );
    
    if IsRightAcyclic( FM ) then
        FM := ShortenResolution( M );
    fi;
    
    HF := Dualize( FM );
    
    N := List( [ 0 .. HighestDegree( HF ) - 1 ], i -> Cokernel( CertainMorphism( HF, i ) ) );
    
    n := Length( N );
    
    PN := List( [ 1 .. n ], i -> Resolution( i + 1, N[i] ) );
    
    Perform( [ 1 .. n ], function( i ) if HasIsRightAcyclic( PN[i] ) and IsRightAcyclic( PN[i] ) then ShortenResolution( i + 1, N[i] ); fi; end );
    
    PN := List( [ 1 .. n ], i -> Resolution( i + 1, N[i] ) );
    
    vert := List( [ 1 .. n - 1 ],
                  j -> PreCompose(
                          CokernelEpi( FirstMorphismOfResolution( N[j] ) ) / CokernelEpi( CertainMorphism( HF, j - 1 ) ),
                          PreCompose( CertainMorphism( HF, j ),
                                  CokernelEpi( CertainMorphism( HF, j ) ) / CokernelEpi( FirstMorphismOfResolution( N[j + 1] ) )
                                  ) / FirstMorphismOfResolution( N[j + 1] )
                          ) );
    
    cm := List( [ 1 .. n - 1 ], j -> HomalgChainMap( vert[j], PN[j], PN[j + 1], [ 0, 1 ] ) );
    
    Perform( cm, CompleteChainMap );
    
    Assert( 1, ForAll( cm, IsMorphism ) );
    
    Perform( cm, function( m ) SetIsMorphism( m, true ); end );
    
    cm := List( cm, Dualize );
    
    if cm = [ ] then
        t := DefectOfExactness( Dualize( PN[1] ), 1 );
    else
        t := DefectOfExactness( Range( cm[1] ), 1 );
    fi;
    
    defs := List( [ 1 .. n - 1 ], j -> DefectOfExactness( cm[j], j + 1 ) );
    
    eta := Dualize(
                   PreCompose( CertainMorphism( HF, 0 ),
                           CokernelEpi( CertainMorphism( HF, 0 ) ) / CokernelEpi( FirstMorphismOfResolution( N[1] ) )
                           ) / FirstMorphismOfResolution( N[1] ) );
    
    epsilon := NatTrIdToHomHom_R( HullObjectInResolution( M ) );
    
    phi := PreCompose( PreCompose( NaturalGeneralizedEmbedding( t ), eta ) / epsilon, HullEpi( M ) );
    
    Assert( 1, IsMorphism( phi ) );
    
    SetIsMorphism( phi, true );
    
    prefilt := [ TheIdentityMorphism( M ), phi ];
    
    Append( prefilt, defs );
    
    degrees := [ -n .. 0 ];
    
    purity_telescope := rec( telescope := true, degrees := degrees );
    
    Perform( degrees, function( c ) purity_telescope.(String( c )) := prefilt[-c + 1]; end );
    
    purity := HomalgAscendingFiltration( purity_telescope );
    
    SetIsPurityFiltration( purity, true );
    
    if HasIsRightAcyclic( FM ) and IsRightAcyclic( FM ) then
        SetIsCompletePurityFiltration( purity, true );
    fi;
    
    SetAttributesByPurityFiltration( purity );
    
    return purity;
    
end );
