const path = require('path');

module.exports = {
  context: __dirname,
  entry: path.join(__dirname, "frontend", "todo_redux.jsx"),
  output: {
    path: path.join(__dirname, "app", "assets", "javascripts"),
    filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['react', 'es2015']
        }
      }
    ]
  },
  resolve: {
    extensions: [".js", ".jsx", "*" ]
  },
  devtool: 'source-map',
};
