const gulp     = require("gulp"),
      sass     = require("gulp-sass"),
      hash     = require("gulp-hash"),
      prefixer = require("gulp-autoprefixer"),
      del      = require("del");

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
  del(['source/css/core-*.css']);

  gulp.src(SRCS.sass)
    .pipe(sass(sassOptions).on('error', sass.logError))
    .pipe(prefixer(prefixerOptions))
    .pipe(gulp.dest('static/css'));

  done();
});

gulp.task('js', (done) => {
  gulp.src(SRCS.js)
    .pipe(gulp.dest('static/js'));

  done();
});

gulp.task('sass-hashed', (done) => {
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
  gulp.watch(SRCS.sassWatch, gulp.series('sass-hashed'));
});

gulp.task('js-hashed', (done) => {
  gulp.src(SRCS.js)
    .pipe(hash())
    .pipe(gulp.dest('static/js'))
    .pipe(hash.manifest('assetHashes.json', hashOptions))
    .pipe(gulp.dest('data'));

  done();
});

gulp.task('js:watch', () => {
  gulp.watch(SRCS.js, gulp.series('js-hashed'));
});

gulp.task('build', gulp.series('sass', 'js'));

gulp.task('dev', gulp.series('sass-hashed', 'js-hashed', gulp.parallel('sass:watch', 'js:watch')));

gulp.task('default', gulp.series('dev'));
