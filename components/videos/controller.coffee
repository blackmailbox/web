YouTube = require './lib/youtube'

exports.show = (req, res) ->
  YouTube.getVideo req.params.id, (err, video) ->
    return res.send 500, { error: 'An error has occurred' } if err?

    res.send 200, { video }

