# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
seed_file = File.join(Rails.root, 'db', 'words_alpha.txt')

def self.import english_words
  EnglishWord.import english_words
  english_words.clear
end

english_words = Array.new

File.open(seed_file,'r').each do |word|
  english_words << EnglishWord.new(word: word.chomp)
  import(english_words) if english_words.size >= 1_000
end

import(english_words)
