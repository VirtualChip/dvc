#!/bin/csh -f
#set verbose = 1
set prog = $0:t
if (($1 == "-h") || ($1 == "--help")) then
   echo "Usage: $prog <DESIGN_CONTR>"
   exit -1
endif

if ($?DVC_HOME == 0) then
   setenv DVC_HOME $0:h/
endif
setenv CSH_DIR $DVC_HOME/csh 
source $CSH_DIR/13_get_project.csh
source $CSH_DIR/14_get_version.csh

if (($1 != "") && ($1 != ":")) then
   setenv DESIGN_CONTR $1
else if {(test -e .dop/env/DESIGN_CONTR)} then
   setenv DESIGN_CONTR `cat .dop/env/DESIGN_CONTR`
else
   setenv DESIGN_CONTR .
endif
   
if {(test -e $CURR_VERSN/$DESIGN_CONTR/.dvc/CONTAINER)} then
   setenv CONTAINER_DIR $CURR_VERSN/$DESIGN_CONTR
else if {(test -e $CURR_PROJT/$DESIGN_CONTR/.dvc/CONTAINER)} then
   setenv CONTAINER_DIR $CURR_PROJT/$DESIGN_CONTR
else if {(test -e $CURR_PROJT/:/$DESIGN_CONTR/.dvc/CONTAINER)} then
   setenv CONTAINER_DIR $CURR_PROJT/:/$DESIGN_CONTR
else if {(test -e $CURR_PROJT/:/:/$DESIGN_CONTR/.dvc/CONTAINER)} then
   setenv CONTAINER_DIR $CURR_PROJT/:/:/$DESIGN_CONTR
else if {(test -e $CURR_PROJT/:/:/:/$DESIGN_CONTR/.dvc/CONTAINER)} then
   setenv CONTAINER_DIR $CURR_PROJT/:/:/:/$DESIGN_CONTR
else if {(test -e $CURR_PROJT/:/:/:/:/$DESIGN_CONTR/.dvc/CONTAINER)} then
   setenv CONTAINER_DIR $CURR_PROJT/:/:/:/:/$DESIGN_CONTR
else
   setenv CONTAINER_DIR $CURR_VERSN
endif

#echo "CONTAINER_DIR = $CONTAINER_DIR"

if {(test -e $CONTAINER_DIR/.dvc/CONTAINER)} then
   setenv DVC_PATH `cat $CONTAINER_DIR/.dvc/CONTAINER`
else
   setenv DVC_PATH :/:/:/:/$DESIGN_CONTR
   echo "ERROR: Not a valid container path : '$CONTAINER_DIR'"
   exit -1
endif

exit 0
