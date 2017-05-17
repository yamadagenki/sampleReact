const path = require('path');
const webpack = require('webpack');
const glob = require("glob");

module.exports = {
  entry: glob.sync("./frontend/js/*.js"),
  output: {
    path: path.join(__dirname, 'public/dist'),
    filename: 'users.js',  // このままならmain.jsが作成される
    publicPath: 'http://localhost:5050/'
  },
  module: {
    loaders: [
      {
        loaders: ['babel-loader'],
        exclude: /node_modules/,
        test: /\.js[x]?$/
      }
    ]
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ],
  resolve: {
    extensions: ['.js', '.json']
  },
  devServer: {
    contentBase: '../public/dist',
    port: 5050
  },
};
