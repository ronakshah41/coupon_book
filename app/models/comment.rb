class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :coupon

  validates :user_id, :presence => true
  validates :text, :presence => true
  validates :coupon_id, :presence => true

end
