require 'rails_helper'

RSpec.describe User do

  describe 'user_rank' do
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
