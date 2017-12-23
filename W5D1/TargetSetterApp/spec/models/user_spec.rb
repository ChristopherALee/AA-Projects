# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
# require 'spec_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6).on(:create) }
  it { should allow_value(nil).for(:password)}
  
  it { should have_many(:goals)}
  
  describe "::find_by_credentials" do
    u = User.create(username: 'user', password: 'password1')
    find = User.find_by_credentials('user', 'password1')
    
    it 'finds a user' do
      find2 = User.find_by_credentials('user', 'password1')
      expect(find).to eq(find2)
    end
    
    it "doesn't find a user" do
      find = User.find_by_credentials('user', 'password2')
      expect(find).to be(nil)
    end
  end
  
  describe '::generate_session_token' do
    it "generates a session token" do
      expect(SecureRandom).to receive(:urlsafe_base64)
      User.generate_session_token
    end
  end
  
  
end
