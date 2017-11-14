class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    require 'digest'
    @email = params[:user_email]
    @passwd = params[:user_password]
    hidden_pw = Digest::MD5.hexdigest(@passwd)
    
    User.create(
      email: @email,
      password: hidden_pw
    )
    redirect_to '/'
    
  end

  def show
  end

  def login
    
  end

  def login_process
    require 'digest'
    
    # 1. DB에 유저가 없을때  => "입력한 이메일이 존재하지 않아"
    # 2. DB에 유저가 있는데,
    # => 패스워드가 다를 때 "패스워드 틀렸어"
    # => 패스워드가 맞을 때 "로그인"
    
    @user = User.find_by(email: params[:user_email])
    
    if @user
      if @user.password == Digest::MD5.hexdigest(params[:user_password])
        flash[:notice]= "로그인 성공하였습니다"
        session[:user_id] = @user.id
        redirect_to '/'
      else
        flash[:alert]= "패스워드가 틀렸습니다"
        redirect_to '/user/login'
      end
    else
      flash[:alert]= "유저가 존재하지 않습니다."
      redirect_to '/user/new'
    end
  end
    
    # require 'digest'
    
    # @email = params[:user_email]
    # @passwd = params[:user_password]
    
    # if User.exists?(email: @email)
    #   @user = User.find_by(email: @email)
    #   if @user.password == Digest::MD5.hexdigest(@passwd)
    #     flash[:notice] = "로그인 성공."
    #     redirect_to '/'
    #   else
    #     flash[:notice] = "비밀번호가 틀렸습니다." 
    #     redirect_to '/user/login'
    #   end
    # end
  
  
  def logout
    session.clear
    flash[:notice] = "로그아웃 되었습니다"
    redirect_to '/'
  end
  
  def note
  
  end
  
  end
