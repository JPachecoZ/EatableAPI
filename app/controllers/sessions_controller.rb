class SessionsController < ApplicationController
  skip_before_action :require_login!

  # POST /login
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      render json: user, status: :ok
    else
      render_unauthorized("Invalid credentials")
    end
  end

  # DELETE /logout
  def destroy
    current_user.invalidate_token
  end
end
