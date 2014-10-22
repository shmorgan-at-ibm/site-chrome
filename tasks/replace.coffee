gulp    = require 'gulp'
replace = require 'gulp-replace'

gulp.task 'replace', ->
  gulp.src 'build/*', '!build/index.html'
    .pipe replace '\\"', '"'
    .pipe replace '"', '\\"'
    .pipe gulp.dest 'tmp'
