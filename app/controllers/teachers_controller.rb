class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show edit update destroy]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher créé avec succès !'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher mis à jour avec succès !'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path, notice: 'Teacher supprimé avec succès !'
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:nom, :prenom)
  end
end
