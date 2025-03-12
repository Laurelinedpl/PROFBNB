class UsersController < ApplicationController
  before_action :authenticate_user! # Assure que l'utilisateur est connecté
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @bookings = @user.bookings
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profil mis à jour avec succès !'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Utilisateur supprimé avec succès !'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :password)
  end

  def authorize_user!
    redirect_to root_path, alert: "Accès interdit !" unless current_user == @user || current_user.admin?
  end
end
