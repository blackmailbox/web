module.exports = class Base
  get: (attr) =>
    @attributes[attr]

  set: (attr, value) =>
    @attributes[attr] = value
