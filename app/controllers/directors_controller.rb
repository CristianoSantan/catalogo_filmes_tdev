class DirectorsController < ApplicationController
  before_action :set_director, only: %i[ show edit update destroy ]

  def index
    @directors = Director.all
  end

  def show
    @movies = Movie.where(director: @director)
  end

  def new
    @director = Director.new
  end

  def edit
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to @director, notice: "O diretor foi criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @director.update(director_params)
      redirect_to @director, notice: "O diretor foi atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @director.destroy!
    redirect_to directors_path, status: :see_other, notice: "O diretor foi destruído com sucesso."
  end

  private
    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name, :nationality, :date_birth, :gender_id)
    end
end
