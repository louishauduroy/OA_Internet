should = require('should')
user = require('../src/user')
assert = require('assert')

describe 'Save & Get', ->
  describe 'Get', ->
    it 'Should get without error', ->
      user.get 'Vincent', (name) ->
        assert.equal 'Louis', name
        return
      return
    return
  describe 'Save', ->
    it 'Should Save without error', ->
      user.save 'Vincent', (name) ->
        assert.equal 'Vincent', name
        return
      return
    return
  return
