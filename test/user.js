var should = require('should')
var user = require('../src/user.js')
var assert = require('assert')

describe('Save & Get', function() {
  describe('Get', function(){
    it('Should get without error', function() {
      user.get('Vincent', function(name) {
          assert.equal("Louis", name);
        });
      });
    });
describe('Save', function() {
  it('Should Save without error', function() {
    user.save('Vincent', function(name) {
        assert.equal("Vincent", name);
      });
    });
  });
});
