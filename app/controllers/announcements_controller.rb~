class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.find_all_by_status(true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  def show
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  def new
    if session[:user_id].nil?
      redirect_to :controller => :users,:action => :login, notice: 'login first'
    end
    @announcement = Announcement.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json #{ render json: @user }
    #end
  end

  def create
    @announcement = Announcement.new(params[:announcement])
    @announcement.user_id=session[:user_id]
    @announcement.status=false

    respond_to do |format|
      if @announcement.save
        format.html {redirect_to @announcement}
      else
        flash[:notice] = 'something went wrong'
        format.html { render action: "new"}
        #format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    if session[:user_id].nil?
      redirect_to :controller => :users,:action => :login, notice: 'login first'
    else
      if User.find_by_id(session[:user_id]).permission === 'admin'
        @announcement = Announcement.find(params[:id])
      else
        redirect_to :action => "show", :id => params[:id]
      end
    end
  end

  def update
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        format.html { redirect_to @announcement }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_announcements
    if session[:user_id].nil?
      redirect_to :controller => :users,:action => :login, notice: 'login first'
    else
      @announcements = Announcement.find_all_by_user_id(session[:user_id])
    end
  end

end
