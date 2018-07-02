/* eslint comma-dangle: ["error",
 {"functions": "never", "arrays": "only-multiline", "objects":
 "only-multiline"} ] */

const webpack = require('webpack');
const pathLib = require('path');
const path = require('path');
const ManifestPlugin = require('webpack-manifest-plugin'); // we'll use this later

const webpackConfigLoader = require('react-on-rails/webpackConfigLoader');
const configPath = path.resolve('..', 'config');
const { output } = webpackConfigLoader(configPath);

const devBuild = process.env.NODE_ENV !== 'production';

const config = {
  entry: [
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'babel-polyfill',
    'react-on-rails',
    './app/bundles/App/startup/registration.jsx'
  ],

  output: {
    filename: '[name]-[chunkhash].js', // [chunkhash] because we've got to do our own cache-busting now
    path: output.path,
    publicPath: output.publicPath,
  },

  resolve: {
    extensions: ['.js', '.jsx'],
  },
  plugins: [
    new webpack.EnvironmentPlugin({ NODE_ENV: 'development' }),
    new ManifestPlugin({
        publicPath: output.publicPath,
        writeToFileEmit: true
      }),
  ],
  module: {
    rules: [
      {
        test: require.resolve('react'),
        use: {
          loader: 'imports-loader',
          options: {
            shim: 'es5-shim/es5-shim',
            sham: 'es5-shim/es5-sham',
          }
        },
      },
      {
        test: /\.jsx?$/,
        use: 'babel-loader',
        exclude: /node_modules/,
      },
    ],
  },
};

module.exports = config;

if (devBuild) {
  console.log('Webpack dev build for Rails'); // eslint-disable-line no-console
  module.exports.devtool = 'eval-source-map';
} else {
  console.log('Webpack production build for Rails'); // eslint-disable-line no-console
}
