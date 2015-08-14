chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'custom-memes', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/custom-memes')(@robot)

  it 'registers a respond listener for meme list', ->
    expect(@robot.respond).to.have.been.calledWith(/meme list/i)

  it 'registers a respond listener for meme me', ->
    expect(@robot.respond).to.have.been.calledWith(/meme (?:me )?(\w+) \"([^"]+)\" \"([^"]+)\"$/i)

  it 'registers a respond listener for meme example', ->
    expect(@robot.respond).to.have.been.calledWith(/meme example$/i)