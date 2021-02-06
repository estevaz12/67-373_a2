class Child < ApplicationRecord
    
    has_many :chores
    has_many :tasks, through: :chores

    validates_presence_of :first_name, :last_name
end
