class Teacher < ApplicationRecord
    has_many :admins
    has_many :students, through: :admins
end
