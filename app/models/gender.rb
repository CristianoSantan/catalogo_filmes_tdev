class Gender < ApplicationRecord
    has_many :directors
    has_many :movies
end
