class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  RANKS = ["JESS", "NOOB", "MUNTER", "PLONKER", "STANDARD", "SASS", "PIRATE", "DON", "GOD"]

  def rank
    count = posts.count
    User::RANKS.each_with_index do |rank, i|
      if i * 200 > count || i * 200 >= 1600
        return RANKS[i]
      end
    end
  end

end
