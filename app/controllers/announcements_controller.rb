class AnnouncementsController < ApplicationController
  def show
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  def new
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
    @announcement = Announcement.find(params[:id])
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
end
