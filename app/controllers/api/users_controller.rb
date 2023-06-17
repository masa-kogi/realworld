class Api::UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: user_response_json(token), status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: user_response_json(token), status: :ok
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio, :image)
  end

  def user_response_json(token)
    {
      user: {
        email: @user.email,
        token: token,
        username: @user.username,
        bio: @user.bio,
        image: @user.image
      }
    }
  end

end
