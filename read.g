#############################################################################
##
##  read.g                                            AbelianSystems package
##
##  Copyright 2010-2011, Mohamed Barakat, University of Kaiserslautern
##                       Alban Quadrat, INRIA Saclay-Île-de-France
##
##  Reading the implementation part of the AbelianSystems package.
##
#############################################################################

## init
ReadPackage( "AbelianSystems", "gap/AbelianSystems.gi" );

## morphisms
ReadPackage( "AbelianSystems", "gap/Morphisms.gi" );

## purity
ReadPackage( "AbelianSystems", "gap/PurityViaAuslanderDuals.gi" );
