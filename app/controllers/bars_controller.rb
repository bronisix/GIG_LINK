class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :destroy]

  def index
    @bars = Bar.all
  end

  def show
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @user = User.find(params[:user_id])
    @bar.user = @user
    if @bar.save
      redirect_to bar_path(@bar)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def create
  #   @bar = Bar.new(bar_params)
  #   @bar.save
  #   redirect_to bar_path(@bar)
  # end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
    redirect_to bar_path(@bar)
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :url, :telephone, :photo)
  end
end
