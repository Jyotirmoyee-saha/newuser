class Student < ApplicationRecord
    has_many :admins
    has_many :teachers, through: :admins
end
