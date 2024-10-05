class GendersController < ApplicationController
  before_action :set_gender, only: %i[ show edit update destroy ]

  def index
    @genders = Gender.all
  end

  def show
    @movies = Movie.where(gender: @gender)
  end

  def new
    @gender = Gender.new
  end

  def edit
  end

  def create
    @gender = Gender.new(gender_params)
  
    if @gender.save
      redirect_to @gender, notice: "O gênero foi criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @gender.update(gender_params)
      redirect_to @gender, notice: "O gênero foi atualizado com sucesso." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gender.destroy!

    redirect_to genders_path, status: :see_other, notice: "O gênero foi destruído com sucesso." 
  end

  private
    def set_gender
      @gender = Gender.find(params[:id])
    end

    def gender_params
      params.require(:gender).permit(:name)
    end
end
