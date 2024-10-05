class Movie < ApplicationRecord
  enum status: { draft: false, published: true }
  belongs_to :director
  belongs_to :gender
end
