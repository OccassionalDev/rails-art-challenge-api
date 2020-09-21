require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    before do 
        @login_params = { email: "cr@example.com", password: "sample" }
    end 

    def login(params)
        post "/api/v1/login", :params => params.to_json,  :headers => { "CONTENT_TYPE" => "application/json" }
    end 

    describe "POST sessions#create" do 
        it "should succesfully log a valid user in" do
            login(@login_params)
            json = JSON.parse(response.body) 

            expect(response).to have_http_status(200)
            expect(json["errors"]).to be_nil
        end 

        it "should not log a invalid user in" do 
            invalid_params = { email: "asdf", password: "asdf" }

            login(invalid_params)
            json = JSON.parse(response.body) 

            expect(response).to have_http_status(200)
            expect(json["errors"]).to_not be_nil
        end

        it "should create a session cookie upon logging in" do 
            login(@login_params)

            expect(response).to have_http_status(200)
            expect(session[:user_id]).to_not be_nil
        end 
    end 

    describe "DELETE sessions#destroy" do 
        it "should delete the session cookie upon logging out" do 
            login(@login_params)

            delete "/api/v1/logout"
            expect(response).to have_http_status(204)
            expect(session[:user_id]).to be_nil
        end 
    end 
end
