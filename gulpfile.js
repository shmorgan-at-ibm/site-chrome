// Require Gulp and Co.
var gulp       = require('gulp');
var sass       = require('gulp-sass');
var uglify     = require('gulp-uglify');
var jshint     = require('gulp-jshint');
var scsslint   = require('gulp-scss-lint');
var lintspaces = require('gulp-lintspaces');
var connect    = require('gulp-connect');
var escape     = require('gulp-replace');
var include    = require('gulp-file-include');
var minifyHTML = require('gulp-minify-html');
var minifyJSON = require('gulp-jsonminify');

// Asset paths
var htmlPath   = 'src/html/*.html';
var sassPath   = 'src/scss/**/*.scss';
var jsPath     = 'src/js/*.js';
var tmpPath    = 'tmp';
var distPath   = 'dist';
var buildPath  = 'build';

// Configuration objects
var sassConfig   = { 'outputStyle': 'compressed' };
var lintConfig   = { 'config': '.scss-lint.yml' };
var editorConfig = { 'editorconfig': '.editorconfig' };

// HTML tasks
gulp.task('html', function() {
  gulp.src(['src/html/nav.html', 'src/html/footer.html'])
    .pipe(minifyHTML({quotes:true}))
    .pipe(gulp.dest(buildPath));
});

// SASS tasks
gulp.task('styles', function() {
  gulp.src([sassPath, '!src/scss/shared/bourbon/**/*.scss', '!src/scss/shared/_reset.scss'])
    .pipe(scsslint(lintConfig))
    .pipe(sass(sassConfig))
    .pipe(gulp.dest(buildPath));
});

// JavaScript tasks
gulp.task('scripts', function() {
  gulp.src(jsPath)
    .pipe(jshint())
    .pipe(jshint.reporter('default'))
    .pipe(uglify())
    .pipe(gulp.dest(buildPath));
});

// Generic linting task
gulp.task('lintspaces', function() {
  gulp.src(['src/**/*', '!src/scss/shared/bourbon/**/*.scss', '!src/scss/shared/_reset.scss', '!src/img/**/*'])
    .pipe(lintspaces(editorConfig))
    .pipe(lintspaces.reporter())
});

// Include HTML partials in primary layout
gulp.task('include', function() {
  gulp.src(['src/html/index.html'])
    .pipe(include())
    .pipe(gulp.dest(buildPath));
});

// Escape double quotes for JSONification of compiled source code
gulp.task('escape', function() {
  gulp.src('build/*', '!build/index.html')
    .pipe(escape('\\"', '"'))
    .pipe(escape('"', '\\"'))
    .pipe(gulp.dest(tmpPath));
});

// Watch files for changes
gulp.task('watch', ['lintspaces'], function() {
  gulp.watch(htmlPath, ['include']);
  gulp.watch(sassPath, ['styles']);
  gulp.watch(jsPath, ['scripts']);
});

// Start web server
gulp.task('server', function() {
  connect.server({
    root: buildPath,
    port: 4000
  });
});

// Build content.json for distribution
gulp.task('dist', ['escape'], function() {
  gulp.src('src/json/content.json')
    .pipe(include())
    .pipe(minifyJSON())
    .pipe(gulp.dest(distPath))
});

// Default task definition
gulp.task('default', ['html', 'styles', 'scripts', 'server', 'include', 'watch']);
