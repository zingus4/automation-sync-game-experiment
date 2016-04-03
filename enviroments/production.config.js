var path = require('path');
var webpack = require('webpack');
var autoprefixer = require('autoprefixer');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var colors = require('colors');
console.log("Building production version".green);

module.exports = {
  entry: [
    './src/index'
  ],
  output: {
    path: path.join(__dirname, '../static'),
    filename: 'bundle.js',
    publicPath: '/static/'
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({ output: {comments: false}, compress: {warnings: false} }),
    new ExtractTextPlugin('style.css', { allChunks: true }),
    new webpack.ProvidePlugin({
      React: "react",
      ReactDOM: 'react-dom',
      Flux: "flux",
      EventEmitter: "events",
      _: "underscore",
      _str: "underscore.string",
      $: "jquery",
      jQuery: "jquery"
    })
  ],
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee', '.css', '.styl']
  },
  postcss: function() {
    return [autoprefixer]
  },
  module: {
    loaders: 
    [
    { test: /\.css$/,
      loader: ExtractTextPlugin.extract('style-loader', 'css-loader?modules&importLoaders=1&localIdentName=[hash:base64:5]!postcss-loader') 
    }, 
    {
      test: /\.styl$/,
      loader: ExtractTextPlugin.extract('style-loader', 'css-loader?modules&importLoaders=1&localIdentName=[hash:base64:5]!postcss-loader!stylus-loader') 
    },
     {
      test: /\.cjsx$/,
      loaders: ['babel', 'coffee', 'cjsx']
    }, {
      test: /\.coffee$/,
      loaders: ['babel', 'coffee']
    }, {
      test: /\.(jpe?g|png|gif)$/i,
      loaders: ["file-loader"]
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