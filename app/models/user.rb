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





  def admin_or_board?
    self.has_role?(:admin) || self.has_role?(:board_member)
  end

  def readable_address
    address = self.address
    numbers = address.scan(/\d+/)
    compass = address.split(/\d+/)
    readable_address = "#{numbers[0]} #{compass[1].try(:upcase)} #{numbers[1]} #{compass[2].try(:upcase)}"
    readable_address
  end

  def handle_board_member_role
    board_positions = false
    self.residents.each do |resident|
      board_positions = true if resident.board_positions.present?
    end
    if board_positions && self.has_role?(:board_member) == false
      self.roles << :board_member
      self.save
    elsif board_positions == false && self.has_role?(:board_member)
      self.roles.delete :board_member
      self.save
    end
  end

  def self.directory_last_name_sort
    self.find(:all, joins: :residents, order: 'residents.last_name').uniq
  end

end
