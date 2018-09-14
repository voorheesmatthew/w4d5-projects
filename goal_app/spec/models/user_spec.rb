# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:username) }
  it { should allow_value(nil).for(:password)}
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6)}
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
