require 'net/http'
require "json/add/core"

def lambda_handler
  path = "https://api.zoom.us/v2/users/{userId}/meetings"
  uri = URI.parse(path)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  payload = {
    topic: "デイリー",
    type: "1",
    duration: "40",
    timezone: "Asia/Tokyo",
    password: "",
    agenda: "進捗報告"
  }.to_json

  req = Net::HTTP::Post.new(uri.path)
  req.body = payload

  res = http.request(req)
  join_url = JSON.parse(res.body)['join_url']
end
