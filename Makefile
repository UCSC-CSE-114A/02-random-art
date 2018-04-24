STACK=stack
BUILD_OPTS=--ghc-options -O0 

UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
  FORMAT=aout
else
ifeq ($(UNAME), Darwin)
  FORMAT=macho
endif
endif

COURSE=cs130s
ASGN=02-random-art

test: clean
	$(STACK) test $(BUILD_OPTS)

bin:
	$(STACK) build $(BUILD_OPTS)

clean: 
	$(STACK) clean

distclean: clean 
	rm -rf .stack-work 

tags:
	hasktags -x -c lib/

turnin: 
	# rm -rf .stack-work
	rm -rf $(ASGN).tgz
	tar -zcvf ../$(ASGN).tgz --exclude .stack-work --exclude .git ../$(ASGN)
	mv ../$(ASGN).tgz . 
	turnin -c $(COURSE) -p $(ASGN) ./$(ASGN).tgz

