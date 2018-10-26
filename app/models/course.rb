class Course < ApplicationRecord
    has_many :spot, inverse_of: :course
    accepts_nested_attributes_for :spot
    has_many :finish
    has_many :prize
    
    #validates :name ,presence: true
    #validates :spot_num ,numericality: true
end
