class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.integer :user_id
      t.string :coupon_link
      t.string :description
      t.string :image_url

      t.timestamps

    end
  end
end
