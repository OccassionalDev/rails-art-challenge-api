require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do 
    @user1 = create(:user)
  end 

  it "is a valid user with valid attributes" do 
    expect(@user1).to be_valid
  end 

  it "have a unique username" do 
    user2 = build(:user, email: "jeff@jeff.com")
    expect(user2).to_not be_valid
  end 

  it "has a unique email" do
    user2 = build(:user, username: "Luminous")
    expect(user2).to_not be_valid
  end 

  it "is not valid without an email" do 
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid 
  end 

  it "is not valid without a username" do 
    user2 = build(:user, username: nil)
    expect(user2).to_not be_valid 
  end 

  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end 

  it "is not valid if password confirmation is nil" do 
    user2 = build(:user, password_confirmation: nil)
    expect(user2).to_not be_valid 
  end 

  it "is not valid when passwords do not match" do 
    user2 = build(:user, password: "sample", password_confirmation: "sample2")
    expect(user2).to_not be_valid
  end 
end
