require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }
  it { should have_many(:comments) }
  
  describe "session token" do 
    it "assigns session token if one is not given" do
      user = FactoryBot.build(:user)
      expect(user.session_token).not_to be_nil
    end
  end
  
  describe "password encryption" do
    it "does not save password to database" do 
      user = FactoryBot.create(:user, password: 'password')
      expect(user.password).not_to be('password')
    end
  end
end
