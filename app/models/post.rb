class Post < ApplicationRecord
belongs_to :user
#has_and_belongs_to_many :admin_users
has_many :managers
has_many :users, through: :managers
end
