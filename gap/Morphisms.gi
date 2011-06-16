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
    
    ByASmallerPresentation( coker_epi );
    ByASmallerPresentation( im_epi );
    
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
    
    ByASmallerPresentation( ker_emb );
    ByASmallerPresentation( im_emb );
    
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
    local iso;
    
    if not IsIdempotent( phi ) then
        TryNextMethod( );
    fi;
    
    iso := ProductOfCokernelEpiAndImageObjectEpi( phi );
    
    ## check assertion:
    Assert( 1, IsIsomorphism( iso ) );
    
    SetIsIsomorphism( iso, true );
    
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
##    <Listing Type="Code"><![CDATA[
InstallMethod( DirectSumDecomposition,
        "for an idempotent",
        [ IsHomalgEndomorphism ],
        
  function( phi )
    
    return Range( DirectSumDecompositionIsomorphism( phi ) );
    
end );
##  ]]></Listing>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
