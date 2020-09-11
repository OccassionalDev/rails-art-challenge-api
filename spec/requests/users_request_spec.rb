require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "GET users#index" do
        it "should get a list of users with valid attributes" do 
            get "/api/v1/users"

            user = User.first
            json = JSON.parse(response.body)

            expect(response).to have_http_status(200)
            expect(json).to contain_exactly({
                id: user.id,
                email: user.email,
                username: user.username
            }.stringify_keys)
        end 
    end 

    describe "POST users#create" do 
        it "should create a new user with valid attributes" do 
            new_user = { user: { username: "test_user", email: "test@test.com", password: "asdf", password_confirmation: "asdf" } }
            
            post "/api/v1/users", :params => new_user.to_json,  :headers => { "CONTENT_TYPE" => "application/json" }
            expect(response).to have_http_status(200)

            json = JSON.parse(response.body)

            expect(json["errors"]).to be_nil
        end 

        it "should not create a new user with invalid attributes" do 
            new_user = { user: { username: "test_user", email: "test@test.com", password: "asdf", password_confirmation: "asdfgh" } }
            
            post "/api/v1/users", :params => new_user.to_json,  :headers => { "CONTENT_TYPE" => "application/json" }
            expect(response).to have_http_status(200)

            json = JSON.parse(response.body)
            
            expect(json["errors"]).to_not be_nil
        end 
    end
end
