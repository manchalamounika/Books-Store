class ShopperController < ApplicationController
  include CurrentCart
  skip_before_action :authorize

  before_action :set_cart

  def index


    if !(params[:searchName].blank?)
      nameSearch = "%"+params[:searchName]+"%"
      @products = Product.where("name like ?", nameSearch).order(:name)
      #  else
      #        @products = Product.order(:name)
      #    end
      #els

    elsif !(params[:searchDescription].blank?)
      descriptionSearch = "%"+params[:searchDescription].to_s+"%"
      @products = Product.where("description like ?", descriptionSearch).order(:description)
      #  else
      # @products = Product.order(:description)
      #end
    elsif !(params[:searchPrice].blank?)
      priceSearch = "%"+params[:searchPrice].to_s+"%"
      @products = Product.where("price like ?", priceSearch).order(:price)
    else
      @products = Product.order(:name)
    end
  end
end
