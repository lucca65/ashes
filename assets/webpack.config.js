const path = require('path')
const webpack = require('webpack')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')


/*
 * Configuration
 **/
module.exports = (env) => {
  const isDev = !(env && env.prod)
  const devtool = isDev ? 'eval' : 'source-map'

  return {
    devtool: devtool,

    context: __dirname,

    entry: {
      app: [
        'js/app.js'
      ]
    },

    output: {
      path: path.resolve(__dirname, '../priv/static'),
      filename: 'js/[name].js',
      publicPath: 'http://localhost:8080/'
    },

    module: {
      rules: [
        {
          test: /\.(jsx?)$/,
          exclude: /node_modules/,
          loader: 'babel-loader',
          options: {
            presets: [
              ['es2015', {modules: false}]
            ]
          }
        },

        {
          test: /\.(gif|png|jpe?g|svg)$/i,
          exclude: /node_modules/,
          loaders: [
            'file-loader',
            {
              loader: 'image-webpack-loader',
              query: {
                progressive: true,
                optimizationLevel: 7,
                interlaced: false,
                pngquant: {
                  quality: '65-90',
                  speed: 4
                }
              }
            }
          ]
        },

        {
          test: /\.(ttf|woff2?|eot|svg)$/,
          exclude: /node_modules/,
          query: { name: 'fonts/[hash].[ext]' },
          loader: 'file-loader'
        },

        {
          test: /\.(css)$/,
          exclude: /node_modules/,
          use: isDev ? [
            'style-loader',
            'css-loader'
          ] : ExtractTextPlugin.extract({
            fallback: 'style-loader',
            use: ['css-loader']
          })
        }
      ]
    },

    resolve: {
      modules: ['node_modules', __dirname],
      extensions: ['.js', '.json', '.jsx', '.css', '.styl']
    },

    plugins: isDev ? [
      new CopyWebpackPlugin([{
        from: 'static'
      }])
    ] : [
      new CopyWebpackPlugin([{
        from: 'static'
      }]),

      new ExtractTextPlugin({
        filename: 'css/[name].css',
        allChunks: true
      }),

      new webpack.optimize.UglifyJsPlugin({
        sourceMap: true,
        beautify: false,
        comments: false,
        extractComments: false,
        compress: {
          warnings: false,
          drop_console: true
        },
        mangle: {
          except: ['$'],
          keep_fnames: true
        }
      })
    ]
  }
}
