class AddQuestionsUserViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.belongs_to :user, index: true
      t.belongs_to :question, index: true
      t.timestamps
    end
  end
end
