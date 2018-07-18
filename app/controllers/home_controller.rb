class HomeController < ApplicationController
  before_action :js_authenticate_user!, only: [:like_movie]
  before_action :authenticate_user! 
  def index
    @products = Product.all
    @p = Product.first
    @home = Home.all
    session[:product_id] = params[:product_id]
    @user_likes_product = Like.where(user_id: current_user.id, product_id: session[:product_id]).first if user_signed_in?
  end
  
  def like_product
    #현재 유저와 params에 담긴 movie간의 좋아요 관계를 설정한다.
    @like = Like.where(user_id: current_user.id, product_id: session[:product_id]).first
    if @like.nil?
       @like=Like.create(user_id: current_user.id,product_id: session[:product_id])
    else
        @like.destroy
    #만약에 현재 로그인한 유저가 이미 좋아요를 눌렀을 경우
    #해당 Like 인스턴스 삭제
    end
  end
end
