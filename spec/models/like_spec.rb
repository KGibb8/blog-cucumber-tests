require 'rails_helper'

RSpec.describe Like do

  before do
    @fred = User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
    @sally = User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
    @post = @sally.posts.create(body: Faker::Lorem.paragraph)
  end
  context 'Fred likes Sallys post' do
    before do
      @like1 = @fred.likes.create(post: @post)
    end
    context 'with valid criteria' do

    end
    context 'with invalid criteria' do
      it 'should not be valid if user has already liked this post' do
        @like2 = @fred.likes.create(post: @post)
        expect(@like2).to_not be_valid
        expect(@like2.errors.messages).equal?(["This user has already liked this post"])
      end
      it 'should not be valid on attempted update' do
        @like1.update(post: @post)
        expect(@like1).to_not be_valid
        expect(@like1.errors.messages).equal?(["You cannot update a like"])
      end
    end
  end


end
