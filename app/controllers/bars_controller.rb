class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :destroy]

  def index
    @bars = policy_scope(Bar)
    @events = current_user.events
  end

  def mybars
    @mybars = current_user.bars
  end

  def show
    authorize @bar
  end

  def new
    @bar = Bar.new
    authorize @bar
  end

  def create
    @bar = Bar.new(bar_params)
    @user = current_user
    @bar.user = @user
    authorize @bar
    if @bar.save!
      redirect_to bar_path(@bar)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @bar = Bar.find(params[:id])
    authorize @bar
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
    redirect_to bar_path(@bar)
    authorize @bar
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    authorize @bar
    redirect_to root_path, status: :see_other
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :url, :telephone, :photo)
  end
end
