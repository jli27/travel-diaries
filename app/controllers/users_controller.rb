class UsersController < ApplicationController
  def show
    @username = params.fetch("username")
    @user = User.where(username: @username).first

    if @user == nil
      redirect_to("/404")
    else
      render(template: "users_html/show")
    end
  end

  def create
    new_username = params.fetch("input_username")
    new_user = User.new
    new_user.username = new_username
    new_user.save
    redirect_to("/users/" + new_username)
  end

  def update
    user_id = params.fetch("user_id")
    update_username = params.fetch("input_username")
    the_user = User.where(id: user_id).first
    the_user.username = update_username
    the_user.save

    redirect_to("/users/" + update_username)
  end
end
