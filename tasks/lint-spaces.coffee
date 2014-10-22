gulp       = require 'gulp'
lintspaces = require 'gulp-lintspaces'

gulp.task 'lint-spaces', ->
  gulp.src ['src/**/*', '!src/scss/shared/bourbon/**/*.scss', '!src/scss/shared/_reset.scss', '!src/img/**/*']
    .pipe lintspaces {'editorconfig': '.editorconfig'}
    .pipe lintspaces.reporter()

