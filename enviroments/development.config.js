var path = require('path');
var webpack = require('webpack');
var autoprefixer = require('autoprefixer');
var stylelint = require('stylelint');
var cssLinterConfig = require('../css-linter-config');
var reporter = require("postcss-reporter");
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  devtool: 'eval',
  entry: [
    'webpack-dev-server/client?http://localhost:3333',
    'webpack/hot/only-dev-server',
    './src/index'
  ],
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: '/static/'
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    new webpack.ProvidePlugin({
      React: "react",
      ReactDOM: 'react-dom',
      Flux: "flux",
      EventEmitter: "events",
      _: "underscore",
      $: "jquery",
      jQuery: "jquery",
      _str: "underscore.string"
    })
  ],
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee', '.css', '.styl']
    // modulesDirectories: ['./node_modules', './src/vendor/js']
  },
  postcss: function() {
    return [
      autoprefixer,
      stylelint(cssLinterConfig),
      reporter({ clearMessages: true })
    ]
  },
  module: {
    loaders: [
    { test: /\.css$/,
      loader: 'react-hot-loader!style-loader!css-loader?modules&importLoaders=1&localIdentName=[name]-[local]__[hash:base64:5]!postcss-loader'
    },
    {
      test: /\.styl$/,
      loader: 'react-hot-loader!style-loader!css-loader?modules&importLoaders=1&localIdentName=[name]-[local]__[hash:base64:5]!postcss-loader!stylus-loader'
    }, {
      test: /\.cjsx$/,
      loaders: ['react-hot', 'babel', 'coffee', 'cjsx']
    }, {
      test: /\.coffee$/,
      loaders: ['react-hot', 'babel', 'coffee']
    }, {
      test: /\.(jpe?g|png|gif)$/i,
      loaders: ['react-hot', 'url?limit=8192']
    },
    {
      test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
      loader: "url-loader?limit=10000&minetype=application/font-woff"
    },
    { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
      loader: "file-loader"
    }
    ]
  }
};