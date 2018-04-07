const gulp     = require("gulp"),
      sass     = require("gulp-sass"),
      hash     = require("gulp-hash"),
      prefixer = require("gulp-autoprefixer");

const SRCS = {
  sass:      'source/scss/core.scss',
  sassWatch: 'source/scss/**/*.scss',
  js:        'source/js/fresh.js'
}

const sassOptions = {
  outputStyle: 'compressed'
}

const prefixerOptions = {
  browsers: ['last 2 versions'],
  cascade: false
}

const hashOptions = {
  deleteOld: true
}

gulp.task('sass', (done) => {
  gulp.src(SRCS.sass)
    .pipe(sass(sassOptions).on('error', sass.logError))
    .pipe(hash())
    .pipe(prefixer(prefixerOptions))
    .pipe(gulp.dest('static/css'))
    .pipe(hash.manifest('assetHashes.json', hashOptions))
    .pipe(gulp.dest('data'));
  done();
});

gulp.task('sass:watch', () => {
  gulp.watch(SRCS.sassWatch, gulp.series('sass'));
});

gulp.task('js', (done) => {
  gulp.src(SRCS.js)
    .pipe(hash())
    .pipe(gulp.dest('static/js'))
    .pipe(hash.manifest('assetHashes.json', hashOptions))
    .pipe(gulp.dest('data'));

  done();
});

gulp.task('js:watch', () => {
  gulp.watch(SRCS.js, gulp.series('js'));
});

gulp.task('build', gulp.series('sass', 'js'));

gulp.task('default', gulp.series('sass', 'js', gulp.parallel('sass:watch', 'js:watch')));
