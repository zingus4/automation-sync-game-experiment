var config            = require('./enviroments/development.config');
var webpack           = require('webpack');
var WebpackDevServer  = require('webpack-dev-server');

webpackDevServer = new WebpackDevServer(webpack(config), {
  hot: true,
  quiet: false,
  noInfo: true,
  inline: true,
  publicPath: config.output.publicPath,
  historyApiFallback: true,
  stats: {
    colors: true,
    progress: true
  }
})

webpackDevServer.listen(3333, '0.0.0.0', function (err, result) {
  if (err) {
    console.log(err);
  }
  console.log('Listening at http://localhost:3333\n');
});