class EnglishWord < ApplicationRecord
  validates :word, uniqueness: true, presence: true
end
