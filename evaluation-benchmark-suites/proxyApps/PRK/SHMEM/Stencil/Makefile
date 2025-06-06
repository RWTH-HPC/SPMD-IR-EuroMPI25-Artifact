include ../../common/SHMEM.defs

##### User configurable options #####
#uncomment any of the following flags (and change values) to change defaults

OPTFLAGS    = $(DEFAULT_OPT_FLAGS) 
#description: change above into something that is a decent optimization on you system

USERFLAGS    = 
#description: parameter to specify optional flags

#set the following variables for custom libraries and/or other objects
EXTOBJS      = 
LIBS         = -lm
LIBPATHS     = 
INCLUDEPATHS = $(SHMEMINC)

### End User configurable options ###

ifndef DOUBLE
  DOUBLE=1
endif
#description: default data type is double precision

ifndef STAR
  STAR=1
endif
#description: default stencil is star shaped

ifndef SPLITFENCE
  SPLITFENCE=0
endif
#description: controls using a single "big" fence, or multiple "smaller" fences

ifndef RESTRICT_KEYWORD
  RESTRICT_KEYWORD=0
endif
#description: the "restrict" keyword can be used on IA platforms to disambiguate  
#             data accessed through pointers (requires -restrict compiler flag)

ifndef RADIUS
  RADIUS=2
endif
#description: default radius of filter to be applied is 2

ifndef LOOPGEN
  LOOPGEN=0
endif
#description: default is compact (non-expanded) form of loop body

ifndef VERBOSE
  VERBOSE=0
endif
#description: default diagnostic style is silent

VERBOSEFLAG     = -DVERBOSE=$(VERBOSE)
RESTRICTFLAG    = -DRESTRICT_KEYWORD=$(RESTRICT_KEYWORD)
RADIUSFLAG      = -DRADIUS=$(RADIUS)
LOOPGENFLAG     = -DLOOPGEN=$(LOOPGEN)
DOUBLEFLAG      = -DDOUBLE=$(DOUBLE)
STARFLAG        = -DSTAR=$(STAR)
SPLITFENCEFLAG  = -DSPLITFENCE=$(SPLITFENCE)

OPTIONSSTRING="Make options:\n\
OPTION                  MEANING                                  DEFAULT\n\
RADIUS=?                radius of stencil                          [2]  \n\
LOOPGEN=0/1             compact/expanded stencil loop body         [0]  \n\
DOUBLE=0/1              single/double precision                    [1]  \n\
RESTRICT_KEYWORD=0/1    disable/enable restrict keyword (aliasing) [0]  \n\
STAR=0/1                box/star shaped stencil                    [1]  \n\
SPLITFENCE=0/1          use one final big/multiple immediate fences[0]  \n\
VERBOSE=0/1             omit/include verbose run information       [0]"

TUNEFLAGS    = $(RESTRICTFLAG) $(VERBOSEFLAG)$(USERFLAGS) $(LOOPGENFLAG)\
               $(DOUBLEFLAG)   $(RADIUSFLAG) $(STARFLAG)  $(SPLITFENCEFLAG)
PROGRAM     = stencil
OBJS        = $(PROGRAM).o $(COMOBJS)

include ../../common/make.common

$(PROGRAM).o: loop_body_star.incl loop_body_compact.incl

loop_body_star.incl:
	@echo "#########################################################################"
	@echo "##### No file loop_body_star.incl -- invoking loop_gen to create it #####"
	@echo "#########################################################################"
	../../common/Stencil/loop_gen $(RADIUS) 1

loop_body_compact.incl:
	@echo "############################################################################"
	@echo "##### No file loop_body_compact.incl -- invoking loop_gen to create it #####"
	@echo "############################################################################"
	../../common/Stencil/loop_gen $(RADIUS) 0

veryclean:
	@rm -f loop_body_star.incl loop_body_compact.incl
	make clean
