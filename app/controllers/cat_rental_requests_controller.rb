class CatRentalRequestsController < ApplicationController
  def new
    @request = CatRentalRequest.new
    @cats = Cat.all.sort_by(:id)
    render :new
  end

  def create
    @request = CatRentalRequest.new(cat_rental_request_params)
    @request.save ? redirect_to cat_url(@request.cat_id) : render :new
  end

  def cat_rental_request_params
    params.require(:cat_rental_reques).permit(:cat_id, :start_date, :end_date)
  end
end