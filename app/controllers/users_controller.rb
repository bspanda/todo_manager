class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_display_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_display_string
  end

  def create
    user_name = params[:name]
    user_email = params[:email]
    user_pass = params[:password]
    new_user = User.create!(
      name: user_name,
      email: user_email,
      password: user_pass,
    )
    response_text = "hay, the new user is  : #{new_user.id}"
    render plain: response_text
  end

  def login
    user_email = params[:email]
    user_pass = params[:password]
    user = User.where("email = ? and password = ?", user_email, user_pass)
    user_status = user.empty? ? "false" : "true"
    render plain: "#{user_status}"
  end
end
