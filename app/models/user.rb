# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, confirmation: true, length: { in: 8..128 }

  has_many :access_grants,
    class_name: 'Doorkeeper::AccessGrant',
    foreign_key: :resource_owner_id,
    dependent: :delete_all

  has_many :access_tokens,
    class_name: 'Doorkeeper::AccessToken',
    foreign_key: :resource_owner_id,
    dependent: :delete_all

  has_many :categories
  has_many :map_users
  has_many :maps, through: :map_users
end
