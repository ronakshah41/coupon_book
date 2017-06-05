class Like < ApplicationRecord

  belongs_to :user
  belongs_to :coupon

  validates :user_id, :presence => true
  validates :user_id, :uniqueness => { :scope => [:coupon_id] }
  validates :coupon_id, :presence => true


end
