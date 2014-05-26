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

  has_many :residents

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def readable_address
    address = self.address
    numbers = address.scan(/\d+/)
    compass = address.split(/\d+/)
    readable_address = "#{numbers[0]} #{compass[1].try(:upcase)} #{numbers[1]} #{compass[2].try(:upcase)}"
    readable_address
  end

end
