#############################################################################
##
##  Morphisms.gi                                      AbelianSystems package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##                  Alban Quadrat, INRIA Saclay-Île-de-France
##
##  Implementations for morphisms.
##
#############################################################################

####################################
#
# methods for operations:
#
####################################

##  <#GAPDoc Label="ProductOfCokernelEpiAndImageObjectEpi">
##  <ManSection>
##    <Attr Arg="phi" Name="ProductOfCokernelEpiAndImageObjectEpi" Label="for an endomorphism"/>
##    <Description>
##    <Listing Type="Code"><![CDATA[
InstallMethod( ProductOfCokernelEpiAndImageObjectEpi,
        "for an endomorphism",
        [ IsHomalgEndomorphism ],
        
  function( phi )
    local coker_epi, im_epi;
    
    coker_epi := CokernelEpi( phi );
    im_epi := ImageObjectEpi( phi );
    
    ByASmallerPresentation( Range( coker_epi ) );
    ByASmallerPresentation( Range( im_epi ) );
    
    DecideZero( coker_epi );
    DecideZero( im_epi );
    
    return ProductMorphism( coker_epi, im_epi );
    
end );
##  ]]></Listing>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>

##  <#GAPDoc Label="CoproductOfKernelEmbAndImageObjectEmb">
##  <ManSection>
##    <Attr Arg="phi" Name="CoproductOfKernelEmbAndImageObjectEmb" Label="for an endomorphism"/>
##    <Description>
##    <Listing Type="Code"><![CDATA[
InstallMethod( CoproductOfKernelEmbAndImageObjectEmb,
        "for an endomorphism",
        [ IsHomalgEndomorphism ],
        
  function( phi )
    local ker_emb, im_emb;
    
    ker_emb := KernelEmb( phi );
    im_emb := ImageObjectEmb( phi );
    
    ByASmallerPresentation( Source( ker_emb ) );
    ByASmallerPresentation( Source( im_emb ) );
    
    DecideZero( ker_emb );
    DecideZero( im_emb );
    
    return ProductMorphism( ker_emb, im_emb );
    
end );
##  ]]></Listing>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>

##  <#GAPDoc Label="DirectSumDecompositionIsomorphism">
##  <ManSection>
##    <Attr Arg="phi" Name="DirectSumDecompositionIsomorphism" Label="for an idempotent"/>
##    <Description>
##    <Listing Type="Code"><![CDATA[
InstallMethod( DirectSumDecompositionIsomorphism,
        "for an idempotent",
        [ IsHomalgEndomorphism ],
        
  function( phi )
    local iso, T, pi1, pi2, iota1, iota2, T1, T2;
    
    if not IsIdempotent( phi ) then
        TryNextMethod( );
    fi;
    
    iso := ProductOfCokernelEpiAndImageObjectEpi( phi );
    
    ## check assertion:
    Assert( 3, IsIsomorphism( iso ) );
    
    SetIsIsomorphism( iso, true );
    
    UpdateObjectsByMorphism( iso );
    
    T := Range( iso );
    
    pi1 := EpiOnLeftFactor( T );
    pi2 := EpiOnRightFactor( T );
    
    iota1 := MonoOfLeftSummand( T );
    iota2 := MonoOfRightSummand( T );
    
    T1 := Range( pi1 );
    T2 := Range( pi2 );
    
    if not IsZero( phi ) and not IsOne( phi ) then
        SetIsZero( T1, false );
        SetIsZero( T2, false );
    fi;
    
    SetPropertiesOfDirectSum( [ T1, T2 ], T, iota1, iota2, pi1, pi2 );
    
    UpdateObjectsByMorphism( iso );
    
    return iso;
    
end );
##  ]]></Listing>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>

##  <#GAPDoc Label="DirectSumDecomposition">
##  <ManSection>
##    <Attr Arg="phi" Name="DirectSumDecomposition" Label="for an idempotent"/>
##    <Description>
##      The direct sum decomposition induced by the idempotent <A>phi</A> of the endomorphism ring.
##    <Listing Type="Code"><![CDATA[
InstallMethod( DirectSumDecomposition,
        "for an idempotent",
        [ IsHomalgEndomorphism ],
        
  function( phi )
    
    return Range( DirectSumDecompositionIsomorphism( phi ) );
    
end );
##  ]]></Listing>
##      <#Include Label="TankModel:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
