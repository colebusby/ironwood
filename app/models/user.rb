require 'role_model'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include RoleModel

  roles_attribute :roles_mask

  roles :admin, :user, :guest, :home_owner, :board_member

  def self.board_members
    board_members = []
    User.all.each do |user|
      board_members << user if user.has_role? :board_member
    end
    board_members
  end

  has_many :board_positions

end
