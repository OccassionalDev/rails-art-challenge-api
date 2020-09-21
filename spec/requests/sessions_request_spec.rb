require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    describe "POST sessions#create" do 
        it "should succesfully log a valid user in" do
            user = User.first
            login_params = { email: "cr@example.com", password: "sample" }

            post "/api/v1/login", :params => login_params.to_json,  :headers => { "CONTENT_TYPE" => "application/json" }
            json = JSON.parse(response.body) 

            expect(response).to have_http_status(200)
            expect(json["errors"]).to be_nil
        end 
    end 
end
