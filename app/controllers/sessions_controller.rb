class SessionsController < ApplicationController
  def new
    @login = Session.new
  end

  def create
    binding.pry
  end

  def destroy
    session.delete(current_user)
    redirect_to '/'
  end
end
