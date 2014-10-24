gulp     = require 'gulp'
sass     = require 'gulp-sass'

gulp.task 'styles', ->
  gulp.src ['src/scss/**/*.scss', '!src/scss/shared/bourbon/**/*.scss', '!src/scss/shared/_reset.scss']
    .pipe sass {'outputStyle': 'compressed'}
    .pipe gulp.dest 'build'
