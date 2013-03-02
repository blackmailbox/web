render = (require 'latte')('landing/templates')

exports.index = (req, res) ->
  res.send render 'index'