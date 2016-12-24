# Description:
#   Custom Meme generator using http://memegen.link api
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot meme list - List of memes and their codes
#   hubot meme me (meme) "top message" "bottom message"
#   hubot meme example - shows an example of how to use memes
#
# Author:
#   Mike Parks - parks.jr@gmail.com

memegenlink = "https://memegen.link/api/templates/"
examples = [
  {key: "morpheus", top: "what if i told you", bottom: "there is no meme"},
  {key: "aag", top:" ", bottom: "aliens"},
  {key: "keanu", top: "i want a full restoration", bottom: "i want it all back"},
  {key: "wonka", top: "tell me more", bottom: "about meme example"},
  {key: "kermit", top: " ", bottom: "but that's none of my business"},
  {key: "ermg", top: "ermahgerd", bottom: "mermes"},
  {key: "doge", top: "such", bottom: "meme"},
  {key: "fry", top: "not sure if meme example", bottom: "or meme troll"}
]
getMemes = (body) ->
  memes = {}
  result = JSON.parse body
  for name, url of result
    idx = url.lastIndexOf('/') + 1
    code = url.slice idx
    memes[code] = name
  memes
encode = (text) ->
  encodeURIComponent(text)

module.exports = (robot) ->
  robot.respond /meme list/i, (msg) ->
    msg.http(memegenlink).get() (err, res, body) ->
      custom_memes = getMemes(body)
      memelist = ''
      memelist += "#{code} - #{name}\n" for code, name of custom_memes
      msg.send memelist

  robot.respond /meme (?:me )?(\w+) (?:\"|“)([^"”“]+)(?:\"|”) (?:\"|“)([^"”“]+)(?:\"|”)$/i, (msg) ->
    key = msg.match[1].toLowerCase()
    meme = key # if key of custom_memes then key else 'doge'
    top = msg.match[2].replace(/\s+/g, '-').trim()
    bottom = msg.match[3].replace(/\s+/g, '-').trim()
    msg.send "http://memegen.link/#{meme}/#{encode(top)}/#{encode(bottom)}.jpg"

  robot.respond /meme example$/i, (msg) ->
    example = msg.random examples
    top = example.top.replace(/"/g, '').replace(/\s+/g, '-').trim()
    bottom = example.bottom.replace(/"/g, '').replace(/\s+/g, '-').trim()
    help = "Example:\n```#{msg.robot.name} meme #{example.key} \"#{example.top}\" \"#{example.bottom}\"```"
    help += "\nwill return this:\n"
    help += "http://memegen.link/#{example.key}/#{escape(top)}/#{escape(bottom)}.jpg"
    msg.send help
