class PustsController < ApplicationController

  before_action :manji, except: :index

  def index
    @posts = User.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    post.create(post_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.permit(:name, :text)
  end

  def manji
    redirect_to action: :index unless user_signed_in?
  end

end
