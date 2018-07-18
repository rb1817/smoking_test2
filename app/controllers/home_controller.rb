class HomeController < ApplicationController
  def index
    @products = Product.all
    @p = Product.first
    @home = Home.all
  end
end
