class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :rating
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
