ENV['APP_ENV'] = 'test'

require 'app'
require 'rspec'
require 'rack/test'

  RSpec.describe "app" do       
    
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'get /' do

       it "returns diff" do  
        get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('OK')                                                                
       end                                                                                                            
      end  

      describe 'post /' do

        it "returns diff" do  
          old = File.read(File.join(File.dirname(__dir__), 'spec', 'old.json'))
  new_swagger = File.read(File.join(File.dirname(__dir__), 'spec', 'new.json'))
         post('/',  { new: new_swagger, old: old}.to_json, { 'CONTENT_TYPE' => 'application/json' })
     expect(last_response).to be_ok
     expect(last_response.body).to eq('{"new_endpoints":[],"removed_endpoints":[],"new_request_params":{"get /api/ecom/{}/categories/{}/productsBySubcategory":["extra is no longer required","new request param: accountId (in: path, type: )"]},"removed_request_params":{"get /api/ecom/{}/categories/{}/productsBySubcategory":["new required request param: accountId","missing request param: extra (in: path, type: )"]},"new_response_attributes":{},"removed_response_attributes":{}}')                                                                
        end                                                                                                            
       end                                                                                                            
 end