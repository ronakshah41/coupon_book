class Follow < ApplicationRecord

  belongs_to :user, :foreign_key => "follower_id"

  belongs_to :followee, :class_name => "User", :foreign_key => "following_id"

  validates :following_id, :presence => true

  validates :follower_id, :presence => true

  validates :follower_id, :uniqueness => { :scope => [:following_id] }

end
