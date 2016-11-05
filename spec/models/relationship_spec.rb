require 'rails_helper'

RSpec.describe Relationship do

  describe 'Relationship to User' do
    before do
      @jack= User.create(email: 'jack@upthehill.net', password: 'password', password_confirmation: 'password')
      @jill= User.create(email: 'jill@upthehill.net', password: 'password', password_confirmation: 'password')
      @relationship = Relationship.create(follower: @jack, followed: @jill)
    end
    context "with valid creation criteria" do
      it "should be valid" do
        expect(@relationship).to be_valid
      end
    end
    context "with invalid creation criteria" do
      it "should be invalid without a follower_id" do
        @relationship.followed = nil
        expect(@relationship).to_not be_valid
      end
      it "should be invalid without a followed_id" do
        @relationship.follower = nil
        expect(@relationship).to_not be_valid
      end
    end
  end

end
