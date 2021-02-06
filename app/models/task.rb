class Task < ApplicationRecord

    has_many :chores
    has_many :children, through: :chores
end
