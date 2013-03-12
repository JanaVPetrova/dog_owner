class UsersController < ApplicationController
  def new
    @user = User.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json #{ render json: @user }
    #end
  end

  def create
    @user = User.new(params[:user])
    @user.permission="user"

    respond_to do |format|
      if @user.save
        format.html { redirect_to :action => "login"}
      else
        flash[:notice] = 'something went wrong'
        format.html { render action: "new"}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
    if session[:user_id].nil?
      if request.post?
        @user = User.find_by_login(params[:login])
        if @user.nil?
          flash[:notice] = 'wrong login'
        else
          if @user.password === params[:password]
            session[:user_id] = @user.id
            #respond_to do |format|
            #  format.html { redirect_to @user }
            #end
          else
            flash[:notice] = 'wrong password'
          end
        end
      end
    else
      @user = User.find_by_id(session[:user_id])
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to ''
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
