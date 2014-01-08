class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.phone = params[:phone1] + "-" + params[:phone2] + "-" + params[:phone3]
    @user.save
    respond_to do |format|
      format.html {render nothing: true}
      format.json {render json: data}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :password)
  end
end