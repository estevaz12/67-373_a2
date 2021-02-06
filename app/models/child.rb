class Child < ApplicationRecord
    
    has_many :chores
    has_many :tasks, through: :chores

    validates_presence_of :first_name, :last_name

    scope :alphabetical, -> {order('last_name, first_name')}
    scope :active, -> {where(active: true)}

    def name
        first_name + ' ' + last_name
    end
end
