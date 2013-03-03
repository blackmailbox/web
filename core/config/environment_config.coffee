require 'js-yaml'

module.exports = (require './environments.yml')[ process.env.NODE_ENV ]
