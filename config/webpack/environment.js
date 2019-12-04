const { environment } = require('@rails/webpacker')

module.exports = environment

{
  externals: {
    // require("jquery") is external and available
    //  on the global var jQuery
    jquery: "jQuery"
  }
}