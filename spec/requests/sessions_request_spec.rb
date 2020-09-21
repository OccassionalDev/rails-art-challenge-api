require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    describe "POST sessions#create" do 
        it "should succesfully log a valid user in" do
            login_params = { email: "cr@example.com", password: "sample" }

            post "/api/v1/login", :params => login_params.to_json,  :headers => { "CONTENT_TYPE" => "application/json" }
            json = JSON.parse(response.body) 

            expect(response).to have_http_status(200)
            expect(json["errors"]).to be_nil
        end 

        it "should not log a invalid user in" do 
            invalid_params = { email: "asdf", password: "asdf" }

            post "/api/v1/login", :params => invalid_params.to_json,  :headers => { "CONTENT_TYPE" => "application/json" }
            json = JSON.parse(response.body) 

            expect(response).to have_http_status(200)
            expect(json["errors"]).to_not be_nil
        end

        it "should create a session cookie upon logging in" do 
            login_params = { email: "cr@example.com", password: "sample" }

            post "/api/v1/login", :params => login_params.to_json,  :headers => { "CONTENT_TYPE" => "application/json" }

            expect(response).to have_http_status(200)
            expect(session[:user_id]).to_not be_nil
        end 
    end 
end
