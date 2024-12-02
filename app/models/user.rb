class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :drumracks
  has_one_attached :profile_picture

  def like?(drumrack)
    likes.where(drumrack: drumrack).any?
  end
end
