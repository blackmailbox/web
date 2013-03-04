qs = require 'qs'
request = require 'request'

userParams = ->
  user: {
    "name": "Keith Norman",
    "first_name": "Keith",
    "last_name": "Norman",
    "username": "keithnorm",
    "id": "124267827",
    "accessToken": "BAAHEY3LOh6IBACD7Ytegu5l0s5Obucb5EcQBhClOtflcJr2b4W9k2tsJLzWGXZAc6gK63zGYKyXw7NqrZAVZBFYjIjABxpHG26ol3uwZAhS5QW5xdxq8cR69ioQZDZD"
  }


requestHandler = (err, response, body) ->
  console.log err, response, body

# request.post 'http://localhost:3000/api/users', {form: userParams()}, requestHandler

request
  url: 'http://localhost:3000/api/users'
  form: userParams()
  method: 'POST'
  headers: {
    'content-type': 'application/x-www-form-urlencoded'
  }
, requestHandler
