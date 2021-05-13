class CatRentalRequestsController < ApplicationController
  before_action :is_owner?, only: [:approve, :deny]

  def new
    @request = CatRentalRequest.new
    @request.cat_id = params[:id]
    render :new
  end

  def create
    @request = CatRentalRequest.new(cat_rental_request_params)
    @request.user_id = current_user.id
    if @request.save 
      redirect_to cat_url(@request.cat_id)
    else
      flash.now[:errors] = @request.errors.full_messages
      render :new
    end
  end

  def approve
    current_cat_rental_request.approve!
    redirect_to cat_url(current_cat)
  end

  def deny
    current_cat_rental_request.deny!
    redirect_to cat_url(current_cat)
  end

  private

  def current_cat_rental_request
    @request ||= CatRentalRequest.includes(:cat).find(params[:id])
  end

  def current_cat
    current_cat_rental_request.cat
  end

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end