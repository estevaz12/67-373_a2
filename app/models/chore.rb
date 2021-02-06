class Chore < ApplicationRecord

    belongs_to :child
    belongs_to :task
end
