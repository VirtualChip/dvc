#!/bin/csh -f
#set verbose = 1
set prog = $0:t
if (($1 == "-h") || ($1 == "--help")) then
   echo "Usage: $prog [-v]"
   exit -1
endif
if (($1 == "-v") || ($1 == "--verbose")) then
   set verbose_mode = 1
   shift argv
endif

if ($1 == "--info") then
   set info_mode = 1
   shift argv
endif

if {(test -e .dop/env/DESIGN_PROJT)} then
  setenv DESIGN_PROJT `cat .dop/env/DESIGN_PROJT`
else if ($?DESIGN_PROJT == 0) then
  setenv DESIGN_PROJT :
endif

if ($?info_mode) then
  echo "PARM: DESIGN_PROJT = $DESIGN_PROJT"
endif

if {(test -e .dop/env/CURR_PROJT)} then
  setenv CURR_PROJT      `cat .dop/env/CURR_PROJT`
else if ($?CURR_PROJT == 0) then
  setenv CURR_PROJT      ":"
endif

