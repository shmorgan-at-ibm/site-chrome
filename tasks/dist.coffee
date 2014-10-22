gulp       = require 'gulp'
include    = require 'gulp-file-include'
minifyJSON = require 'gulp-jsonminify'

# Build content.json for distribution
gulp.task 'dist', ['replace'], ->
  gulp.src 'src/json/content.json'
    .pipe include()
    .pipe minifyJSON()
    .pipe gulp.dest 'dist'
