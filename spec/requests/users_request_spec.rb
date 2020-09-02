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
end
