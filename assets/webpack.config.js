const path = require('path')
const webpack = require('webpack')
const ExtractTextPlugin = require('extract-text-webpack-plugin')

function resolve (dir) {
  return path.join(__dirname, '..', dir)
}

/*
 * Configuration
 **/
module.exports = (env) => {
  const isDev = !(env && env.prod)
  const devtool = isDev ? 'eval' : 'source-map'

  return {
    mode: isDev ? 'development' : 'production',
    devtool: devtool,
    context: __dirname,
    entry: {
      app: 'src/main.js'
    },
    output: {
      path: path.resolve(__dirname, '../priv/static'),
      filename: 'js/[name].js',
      publicPath: 'http://localhost:8081/'
    },
    resolve: {
      modules: ['node_modules', __dirname],
      extensions: ['.js', '.json', '.css', '.json', '.vue'],
      alias: {
        '@': path.resolve(__dirname, 'src/'),
        'vue$': 'vue/dist/vue.esm.js'
      }
    },

    module: {
      rules: [
        {
          test: /\.js$/,
          include: ['/src'],
          exclude: /node_modules/,
          loader: 'babel-loader',
          options: { presets: ['@babel/preset-env'] }
        },
        {
          test: /\.vue$/,
          loader: 'vue-loader'
        },
        {
          test: /\.css$/,
          exclude: /node_modules/,
          use: [
            {
              loader: 'css-loader',
              options: { minimize: true }
            },
          ]
        }

        // {
        //   test: /\.(gif|png|jpe?g|svg)$/i,
        //   exclude: /node_modules/,
        //   loaders: [
        //     'file-loader',
        //     {
        //       loader: 'image-webpack-loader',
        //       query: {
        //         progressive: true,
        //         optimizationLevel: 7,

        //         interlaced: false,
        //         pngquant: {
        //           quality: '65-90',
        //           speed: 4
        //         }
        //       }
        //     }
        //   ]
        // },

        // {
        //   test: /\.(ttf|woff2?|eot|svg)$/,
        //   exclude: /node_modules/,
        //   query: { name: 'fonts/[hash].[ext]' },
        //   loader: 'file-loader'
        // },

 ,       // {
        //   test: /\.(scss|sass)$/,
        //   exclude: /node_modules/,
        //   use: isDev ? [
        //     { loader: "style-loader" },
        //     { loader: "css-loader" },
        //     { loader: "sass-loader" }
        //   ] : ExtractTextPlugin.extract({
        //     fallback: 'style-loader',
        //     use: ['sass-loader']
        //   })
        // }
      ]
    },

    plugins: [
      new ExtractTextPlugin({
        filename: 'css/[name].css',
        allChunks: true
      }),

      new webpack.LoaderOptionsPlugin({
        minimize: true,
        comments: false
      })
    ]
  }
}
