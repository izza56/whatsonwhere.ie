class LoginBoxController < ApplicationController
  def login
    # Put what the user selected into a instance variable for use in views
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      render :update do |page|
        page.replace_html :login_box, :partial => 'login_box/welcome'
      end
    else
      render :update do |page|
        page.replace_html :login_box, :partial => 'login_form'
      end
    end
  end
end
