class Coupon < ApplicationRecord

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :fans, :through => :likes, :source => :user


  validates :user_id, :presence => true
  validates :description, :presence => true
  validates :coupon_link, :presence => true
  validates :coupon_link, :uniqueness => { :scope => [:user_id] }

end
