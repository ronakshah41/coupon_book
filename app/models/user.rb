class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :coupons, :dependent => :destroy

  has_many :follows_as_follower, :class_name => "Follow", :foreign_key => "follower_id", :dependent => :destroy

  has_many :follows_as_followee, :class_name => "Follow", :foreign_key => "following_id", :dependent => :destroy

  has_many :comments, :dependent => :destroy

  has_many :likes, :dependent => :destroy

  validates :username, :presence => true

  validates :username, :uniqueness => { :case_sensitive => true }

end
