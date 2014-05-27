class HomeownersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.find(:all, joins: :residents, order: 'residents.last_name').uniq
  end
end