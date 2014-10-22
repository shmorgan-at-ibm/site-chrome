gulp    = require 'gulp'
include = require 'gulp-file-include'

gulp.task 'html', ['styles', 'scripts'], ->
  gulp.src ['src/html/index.html']
    .pipe include()
    .pipe gulp.dest 'build'
