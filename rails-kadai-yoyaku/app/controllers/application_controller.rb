class ApplicationController < ActionController::Base

  helper_method :set_current_user, :logged_in?
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      posts_path
    else
      flash[:notice] = "新規登録完了しました"
      posts_path
    end
  end

  def after_sign_out_path_for(resource)
    posts_path
  end

  #def after_update_path_for(resource)
    #posts_path
  #end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
