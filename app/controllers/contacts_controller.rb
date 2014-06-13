class ContactsController < ApplicationController

  def index
    @board_members = Resident.board_members
  end
end