require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @newuser = User.new(first_name: "Pete", last_name: "Venkman", email: "ghost@buster.com", password: "testpw", password_confirmation: "testpw")
    end

    it "requires a password and password_confirmation" do
      @user2 = User.new(first_name: "Pete", last_name: "Venkman", email: "ghost@buster.com", password: nil, password_confirmation: nil)
      @user2.save
      expect(@user2).not_to be_valid
    end

    it "saves when the password and password_confirmation match" do
      @newuser.save
      expect(@newuser.password).to eq(@newuser.password_confirmation)
    end

    it "doesnt save when the password and password_confirmation do NOT match" do
      @newuser.password_confirmation = "wrongpw"
      @newuser.save
      expect(@newuser).not_to be_valid
    end
 
    it "does not save if email provided isnt unique (already exists in DB, not case sensitive)" do
      @newuser.save
      @anotheruser = User.new(first_name: "Ray", last_name: "Stanz", email: "ghost@buster.COM", password: "anothertestpw", password_confirmation: "anothertestpw")
      @anotheruser.save
      expect(@anotheruser).not_to be_valid
    end

    it "saves when all fields were populated" do
      @newuser.save
      expect(@newuser).to be_valid
    end

    it "requires a password have a miniumum length of 3 characters" do
      @anotheruser = User.new(first_name: "Ray", last_name: "Stanz", email: "ghost@buster.COM", password: "pw", password_confirmation: "pw")
      expect(@anotheruser).not_to be_valid
    end

  end
end
