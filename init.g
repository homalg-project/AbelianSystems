#############################################################################
##
##  init.g                                            AbelianSystems package
##
##  Copyright 2010-2011, Mohamed Barakat, University of Kaiserslautern
##                       Alban Quadrat, INRIA Saclay-Île-de-France
##
##  Reading the declaration part of the AbelianSystems package.
##
#############################################################################

## init
ReadPackage( "AbelianSystems", "gap/AbelianSystems.gd" );

## morphisms
ReadPackage( "AbelianSystems", "gap/Morphisms.gd" );

## purity
ReadPackage( "AbelianSystems", "gap/PurityViaAuslanderDuals.gd" );
