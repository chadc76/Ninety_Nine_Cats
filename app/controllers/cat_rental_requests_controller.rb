class CatRentalRequestsController < ApplicationController
  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(cat_rental_request_params)
    @request.save ? redirect_to cat_url(@request.cat_id) : render :new
  end
end