class PostController < ApplicationController
  def index  #게시글 다 보여주는 페이지
    @posts = Post.all   #배열로 저장되있음
    @users = User.all
  end

  def new #게시글 작성하는 form 페이지
  
  end

  def create  #게시글 작성 DB에 저장
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: session[:user_id]
    )
    redirect_to '/'
    
  end
  
  def show  #게시글 1개 보는 페이지
    @post = Post.find(params[:id])
  end


  def create_comment # 해당하는 글에 댓글
    Comment.create(
      content: params[:comment],
      post_id: params[:id]
    )
    redirect_to :back
  end
end
