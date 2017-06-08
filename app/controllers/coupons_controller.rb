class CouponsController < ApplicationController
  def index

    @follows = User.find_by(id: current_user.id).follows_as_follower.pluck(:following_id)
    @coupons = Coupon.where(user_id: @follows).order(created_at: :desc)



    render("coupons/index.html.erb")
  end

  def show
    @coupon = Coupon.find(params[:id])

    render("coupons/show.html.erb")
  end

  def new
    @coupon = Coupon.new

    render("coupons/new.html.erb")
  end

  def create
    @coupon = Coupon.new

    @coupon.user_id = params[:user_id]
    @coupon.coupon_link = params[:coupon_link]
    @coupon.description = params[:description]
    @coupon.image_url = params[:image_url]

    save_status = @coupon.save

    if save_status == true
      redirect_to(:back, :notice => "Coupon created successfully.")
    else
      render("coupons/new.html.erb")
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])

    render("coupons/edit.html.erb")
  end

  def update
    @coupon = Coupon.find(params[:id])

    @coupon.user_id = params[:user_id]
    @coupon.coupon_link = params[:coupon_link]
    @coupon.description = params[:description]
    @coupon.image_url = params[:image_url]

    save_status = @coupon.save

    if save_status == true
      redirect_to("/", :notice => "Coupon updated successfully.")
    else
      render("coupons/edit.html.erb")
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])

    @coupon.destroy

    if URI(request.referer).path == "/coupons/#{@coupon.id}"
      redirect_to("/", :notice => "Coupon deleted.")
    else
      redirect_to(:back, :notice => "Coupon deleted.")
    end
  end
end
