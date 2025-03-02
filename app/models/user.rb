class User < ApplicationRecord
    # has_secure_password
    has_many :managers
has_many :posts, through: :managers

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum:6, maximum:6}
    validates :address, presence: true


    scope :by_password, lambda { where(:password => "123456")}
    # Ex:- scope :active, lambda {where(:active => true)}
    scope :newest_first, lambda {order("created_at DESC")}
    scope :search, lambda {|query| where(["username LIKE ?", "%#(query)%"])}

end