require 'rails_helper'

RSpec.describe User do

  describe 'Follow and unfollow other Users' do
    before do
      @jack= User.create(email: 'jack@upthehill.net', password: 'password', password_confirmation: 'password')
      @jill= User.create(email: 'jill@upthehill.net', password: 'password', password_confirmation: 'password')
    end
    it "should follow and unfollow a user" do
      @jack.follow @jill
      expect(@jack.following.first).to eq @jill
      expect(@jack.following? @jill).to be_truthy
      @jack.unfollow @jill
      expect(@jack.following.first).to_not eq @jill
      expect(@jack.following? @jill).to be_falsey
    end
  end

  describe 'User rank based on forum contribution' do
    before do
      @user = User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
      5.times do
        @user.posts.create(body: Faker::Lorem.paragraph)
      end
    end
    it 'should assign a rank based on the number of posts for a given user' do
      expect(@user.rank).to eq("NOOB")
      module ActiveRecord
        module Calculations
          def count(count)
            201
          end
        end
      end
      expect(@user.rank).to eq("MUNTER")
      module ActiveRecord
        module Calculations
          def count(count)
            401
          end
        end
      end
      expect(@user.rank).to eq("PLONKER")
      module ActiveRecord
        module Calculations
          def count(count)
            1601
          end
        end
      end
      expect(@user.rank).to eq("GOD")
    end
  end


end
