class ExampleEmailController < ApplicationController
  before_action :authenticate_user!

  def index
    UserMailer.example_email(current_user).deliver_later
  end
end
