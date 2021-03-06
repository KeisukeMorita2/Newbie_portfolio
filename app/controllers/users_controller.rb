# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_user_logged_in, only: %i[index show edit followings followers likes]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を変更しました。'
        redirect_to @user
      else
        flash.now[:danger] = 'ユーザー情報の変更に失敗しました。'
        render :edit
      end
    else
      redirect_to root_url
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end

  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
