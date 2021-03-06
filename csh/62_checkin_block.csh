#!/bin/csh -f
#set verbose=1
set prog = $0:t
if (($1 == "-h") || ($1 == "--help")) then
   echo "Usage: $prog <DESIGN_BLOCK>"
   exit -1
endif
echo "======================================================="
echo "TIME: @`date +%Y%m%d_%H%M%S` BEGIN $prog $*"

if ($?DVC_HOME == 0) then
   setenv DVC_HOME $0:h/..
endif
setenv CSH_DIR $DVC_HOME/csh
source $CSH_DIR/12_get_server.csh
source $CSH_DIR/13_get_project.csh
source $CSH_DIR/14_get_design.csh

if ($1 != "") then
   if (($1 != "_") && ($1 != ".")) then
   setenv DESIGN_BLOCK $1
   endif 
   shift argv
endif

echo "INFO: Checkin Project Design Block : $DESIGN_BLOCK"
setenv DVC_PATH $DESIGN_PHASE/$DESIGN_BLOCK

source $CSH_DIR/69_checkin_dvc_path.csh

echo "TIME: @`date +%Y%m%d_%H%M%S` END   $prog"
echo "======================================================="
