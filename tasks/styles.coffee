gulp     = require 'gulp'
sass     = require 'gulp-sass'
scsslint = require 'gulp-scss-lint'

gulp.task 'styles', ->
  gulp.src ['src/scss/**/*.scss', '!src/scss/shared/bourbon/**/*.scss', '!src/scss/shared/_reset.scss']
    .pipe scsslint {'config': '.scss-lint.yml'}
    .pipe sass {'outputStyle': 'compressed'}
    .pipe gulp.dest 'build'
