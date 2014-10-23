BIN             = ./node_modules/.bin
TEST_REPORTER   = --reporter list
GULP_REPORTER   = --reporters coffee-script
COFFEE_COMPILER = --compilers coffee:coffee-script/register

test:
	$(BIN)/mocha $(COFFEE_COMPILER)

gulp:
	$(BIN)/gulp $(GULP_REPORTER)

gulp-dist:
	$(BIN)/gulp $(GULP_REPORTER) dist

.PHONY: test
