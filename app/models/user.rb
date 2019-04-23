class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :beans, dependent: :destroy
  has_many :favorite_beans, dependent: :destroy
  has_many :fav_beans, through: :favorite_beans, source: :bean
  has_many :my_blends, dependent: :destroy
  has_many :favorite_blends, dependent: :destroy
  has_many :fav_blends, through: :favorite_blends, source: :my_blend
  has_many :comment, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :profile, length: { maximum: 1000 }

  mount_uploader :icon, IconUploader
end
