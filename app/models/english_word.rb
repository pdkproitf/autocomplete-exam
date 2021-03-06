class EnglishWord < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_word, :against => :word,
                  :using => {
                    :tsearch => {:prefix => true}
                  }

  validates :word, uniqueness: true, presence: true
end
