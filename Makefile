test:
	./node_modules/.bin/mocha --compilers coffee:coffee-script/register

gulp:
	./node_modules/.bin/gulp --reporters coffee-script

gulp-dist:
	./node_modules/.bin/gulp --reporters coffee-script dist

.PHONY: test
