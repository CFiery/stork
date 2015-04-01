class BirthsController < ApplicationController
  skip_before_action :authorize, only: [:show]

  def index
    @births = Birth.all
  end

  def show
    @birth = Birth.find(params[:id])
  end

  def new
    @birth = Birth.new
  end

  def edit
    @birth = Birth.find(params[:id])
  end

  def create
    @birth = Birth.new(birth_params)

    if @birth.save
      redirect_to @birth
    else
      render 'new'
    end
  end

  def update 
    @birth = Birth.find(params[:id])
  
    if @birth.update(birth_params)
      redirect_to @birth
    else
      render 'new'
    end
  end

  private
    def birth_params
      params.require(:birth).permit(:due_date)
    end
end
