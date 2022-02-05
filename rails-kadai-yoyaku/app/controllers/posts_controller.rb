class PostsController < ApplicationController

  #before_action :manji, except: :index
  before_action :set_q, only: [:index, :search]
  #before_action :authenticate_user!


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new(
      #user_id: @current_user.id
    )
  end

  def create
    @post = Post.new(params.require(:post).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image))
    @post.user_id = current_user.id
    logger.debug(@post.inspect)
      if @post.save
        flash[:notice] = "ルーム情報を新規登録しました"
        redirect_to :posts
      else
        render "new"
      end
  end

  def show
    @user = current_user.id
    @post = Post.where(user_id: @user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @results = @q.result
  end

  private
  def post_params
    params.permit(:name, :text)
  end

  #def manji
    #redirect_to action: :index unless user_signed_in?
  #end

  def set_q
    @q = Post.ransack(params[:q])
  end

end
