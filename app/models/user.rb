class User < ApplicationRecord
    validates :name ,presence: true
    validates :pass ,presence: true
end
