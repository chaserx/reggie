class UsersController < ApplicationController
  # there's probably a better practice for this 
  # idea here is that the first user, admin, can create an account while subsequent users must be created by admin
  # alternatively seed data could have solved this, i think.
  # db hit
  if User.count == 0
    before_filter :require_user, :except => [:new, :create]
  else
    before_filter :require_user
  end

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "Account registered!"
        redirect_to registrations_url
      else
        render :action => :new
      end
    end

    def show
      @user = @current_user
    end

    def edit
      @user = @current_user
    end

    def update
      @user = @current_user # makes our views "cleaner" and more consistent
      if @user.update_attributes(params[:user])
        flash[:notice] = "Account updated!"
        redirect_to account_url
      else
        render :action => :edit
      end
    end

end
