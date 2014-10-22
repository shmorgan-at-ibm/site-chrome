# Require Gulp and Co.
gulp       = require 'gulp'
sass       = require 'gulp-sass'
uglify     = require 'gulp-uglify'
jshint     = require 'gulp-jshint'
scsslint   = require 'gulp-scss-lint'
lintspaces = require 'gulp-lintspaces'
connect    = require 'gulp-connect'
escape     = require 'gulp-replace'
include    = require 'gulp-file-include'
minifyHTML = require 'gulp-minify-html'
minifyJSON = require 'gulp-jsonminify'

# Asset paths
htmlPath   = 'src/html/*.html'
sassPath   = 'src/scss/**/*.scss'
jsPath     = 'src/js/*.js'
tmpPath    = 'tmp'
distPath   = 'dist'
buildPath  = 'build'

# Configuration objects
sassConfig    = { 'outputStyle': 'compressed' }
lintConfig    = { 'config': '.scss-lint.yml' }
editorConfig  = { 'editorconfig': '.editorconfig' }
minHTMLConfig = { 'quotes': true }

# HTML tasks
gulp.task 'html', ->
  gulp.src ['src/html/nav.html', 'src/html/footer.html']
    .pipe minifyHTML minHTMLConfig
    .pipe gulp.dest buildPath

# SASS tasks
gulp.task 'styles', ->
  gulp.src [sassPath, '!src/scss/shared/bourbon/**/*.scss', '!src/scss/shared/_reset.scss']
    .pipe scsslint lintConfig
    .pipe sass sassConfig
    .pipe gulp.dest buildPath
    .pipe gulp.dest buildPath

# JavaScript tasks
gulp.task 'scripts', ->
  gulp.src jsPath
    .pipe jshint()
    .pipe jshint.reporter 'default'
    .pipe uglify()
    .pipe gulp.dest buildPath
    .pipe gulp.dest buildPath

# Generic linting task
gulp.task 'lintspaces', ->
  gulp.src ['src/**/*', '!src/scss/shared/bourbon/**/*.scss', '!src/scss/shared/_reset.scss', '!src/img/**/*']
    .pipe lintspaces editorConfig
    .pipe lintspaces.reporter()

# Include HTML partials in primary layout
gulp.task 'include', ['styles', 'scripts'], ->
  gulp.src ['src/html/index.html']
    .pipe include()
    .pipe gulp.dest buildPath
    .pipe gulp.dest buildPath

# Escape double quotes for JSONification of compiled source code
gulp.task 'escape', ->
  gulp.src 'build/*', '!build/index.html'
    .pipe escape '\\"', '"'
    .pipe escape '"', '\\"'
    .pipe gulp.dest tmpPath

# Watch files for changes
gulp.task 'watch', ['lintspaces'], ->
  gulp.watch htmlPath, ['include']
  gulp.watch sassPath, ['styles']
  gulp.watch jsPath, ['scripts']

# Start web server
gulp.task 'server', ->
  connect.server
    root: buildPath,
    port: 4000

# Build content.json for distribution
gulp.task 'dist', ['escape'], ->
  gulp.src 'src/json/content.json'
    .pipe include()
    .pipe minifyJSON()
    .pipe gulp.dest distPath

# Default task definition
gulp.task 'default', ['styles', 'scripts', 'include', 'html', 'watch', 'server']
