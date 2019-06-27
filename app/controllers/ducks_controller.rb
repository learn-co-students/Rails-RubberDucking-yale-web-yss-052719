class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
    @students = Student.all
  end

  def create
    @duck = Duck.new(duck_params)
    if @duck.save
      redirect_to duck_path(@duck)
    else
      flash[:error] = @duck.errors.full_messages
      @students = Student.all
      render :new
    end
  end

  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params)
      redirect_to duck_path(@duck)
    else
      flash[:error] = @duck.errors.full_messages
      @students = Student.all
      render :edit
    end
  end


  private
  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
