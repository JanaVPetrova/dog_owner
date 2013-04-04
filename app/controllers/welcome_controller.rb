class WelcomeController < ApplicationController


  def index
    login
  end

  def login
    if cookies[:user_id].nil?
      if request.post?
        @user = User.find_by_login(params[:login])
        if @user.nil?
          flash[:notice] = 'wrong login'
        else
          if @user.password === params[:password]
            cookies[:user_id] = @user.id
            #respond_to do |format|
            #  format.html { redirect_to @user }
            #end
          else
            flash[:notice] = 'wrong password'
          end
        end
      end
    else
      @user = User.find_by_id(cookies[:user_id])
    end
  end

end
