class CreateEnglishWords < ActiveRecord::Migration[5.0]
  def change
    create_table :english_words do |t|
      t.string :word

      t.timestamps
    end
  end
end
