class Exchange < ApplicationRecord
    belongs_to :user ,optional: true
    belongs_to :course ,optional: true

    validates :user_id, uniqueness:{scope: [:course_id]}
    #validates :user_id, numericality :true
    #validates :course_id, numericality :true
end
