class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(uid: params[:user][:uid],pass: params[:user][:pass])
    if @user.valid? #validatesを実行してくれる
      #TODO:成功したことを
      @user.pass = BCrypt::Password.create(params[:user][:pass])
      @user.save
      flash[:notice] = '[１メッセージ追加しました]'
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end
