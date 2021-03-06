#!/bin/csh -f
#set verbose=1
set prog=$0:t
if (($1 == "") || ($1 == "-h") || ($1 == "--help")) then
   echo "Usage: $prog <DESIGN_VERSN> <DESIGN_STAGE>"
   exit -1
endif
echo "======================================================="
echo "TIME: @`date +%Y%m%d_%H%M%S` BEGIN $prog $*"

if ($?DVC_HOME == 0) then
   setenv DVC_HOME $0:h/..
endif
setenv CSH_DIR $DVC_HOME/csh
setenv ETC_DIR $DVC_HOME/etc
source $CSH_DIR/12_get_server.csh
source $CSH_DIR/13_get_project.csh
source $CSH_DIR/14_get_design.csh
source $CSH_DIR/05_set_container.csh

if {((test -d $CONTAINER_DIR)&&(test -d $PROJT_PATH/$CONTAINER_PATH))} then
   echo "INFO: Remove Project Design Container '$CONTAINER_PATH'."
   rm -fr $PROJT_PATH/$CONTAINER_PATH
   svn remove $SVN_URL/$DESIGN_PROJT/$CONTAINER_PATH -m "Remove Design Container"
#   rm -fr $CURR_CONTR
else
   echo "ERROR: Can not remove Design Container '$CONTAINER_DIR'!"
endif

echo "TIME: @`date +%Y%m%d_%H%M%S` END   $prog"
echo "======================================================="
exit 0
