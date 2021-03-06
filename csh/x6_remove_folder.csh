#!/bin/csh -f
set prog=$0:t
if (($1 == "") || ($1 == "-h") || ($1 == "--help")) then
   echo "Usage: $prog <DVC_PATH>"
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
source $CSH_DIR/04_set_folder.csh

if (($phase == "") || ($phase == ".") || ($phase == ":") || ($phase == "_")) then
   set phase $DESIGN_PHASE
endif

if (($block == "") || ($block == ".") || ($block == ":") || ($block == "_")) then
   set block $DESIGN_BLOCK
endif

if (($stage == "") || ($stage == ".") || ($stage == ":") || ($stage == "_")) then
   set stage $DESIGN_STAGE
endif

if (($version == "") || ($version == ".") || ($version == ":") || ($version == "_")) then
   set version $DESIGN_VERSN
endif

setenv DVC_PATH $phase/$block/$stage/$version

setenv PROJT_URL $SVN_URL/$DESIGN_PROJT
setenv PHASE_URL $PROJT_URL/$phase
setenv BLOCK_URL $PHASE_URL/$block
setenv STAGE_URL $BLOCK_URL/$stage
setenv VERSN_URL $STAGE_URL/$version

svn info $VERSN_URL >& /dev/null
if ($status == 0) then
   echo "INFO: Remove Project Design Version - $DVC_PATH"
   svn remove $VERSN_URL -m "Remove Design Version $version"
else
   echo "ERROR: Can not find Design Version - $DVC_PATH"
endif

echo "TIME: @`date +%Y%m%d_%H%M%S` END   $prog"
echo "======================================================="
exit 0
