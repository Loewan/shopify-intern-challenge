const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.append("Provice", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

module.exports = environment