class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
  
  	@user = User.new(params[:user])
	  if @user.save
    	@user.add_role params[:user][:role]
    	flash[:notice] = "You have signed up successfully."
         sign_in_and_redirect(@user,current_user)
    end
    
    # add custom create logic here
  end

  def update
    super
  end
end 