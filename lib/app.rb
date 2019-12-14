require 'sinatra'
require 'swagger/diff'

get '/' do
  'OK'
end

post '/' do
  request.body.rewind
  request_payload = JSON.parse request.body.read

  #do something with request_payload
  old = body request_payload['old']
  new_swagger = body request_payload['new']
  diff = Swagger::Diff::Diff.new(old, new_swagger)
  diff.changes.to_json
end
