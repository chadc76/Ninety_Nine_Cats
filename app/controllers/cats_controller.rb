class CatsController < ApplicationController
  before_action :require_current_user!, except: [:index, :show]
  before_action :is_owner?, only: [:edit, :update]
  def index
    @cats = Cat.all.sort_by(&:id)
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    @columns = Cat.column_names.select{|name| !["id", "name", "updated_at", "created_at", "user_id", "description"].include?(name)}
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save 
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user.cats.select { |cat| cat.id = params[:id] }.first
    render :edit
  end

  def update
    @cat = current_user.cats.select { |cat| cat.id = params[:id] }.first
    if @cat.update(cat_params) 
      redirect_to cat_url(@cat)
    else 
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :age, :sex, :description)
  end
end