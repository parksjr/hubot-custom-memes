Helper = require 'hubot-test-helper'
expect = require('chai').expect
helper = new Helper '../src/custom-memes.coffee'

describe 'custom-memes', ->
  beforeEach ->
    @room = helper.createRoom({httpd: false})
  context 'user wants the list of memes', ->
    beforeEach ->
      @room.user.say 'bob', 'hubot meme list'
    it 'should respond with a list of memes', ->
      expect(@room.messages).to.eql [
        ['bob', 'hubot meme list']
        ['hubot', 'list of memes']
      ]
  context 'user wants a keanu meme', ->
    beforeEach ->
      @room.user.say 'andrew', 'hubot meme keanu "-" "keanu"'
    it 'should respond with a keanu meme', ->
      expect(@room.messages).to.eql [
        ['andrew', 'hubot meme keanu "-" "keanu"']
        ['hubot', 'http://memegen.link/keanu/-/keanu.jpg']
      ]