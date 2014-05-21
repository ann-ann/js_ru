class AddDefaultValues < ActiveRecord::Migration
  def change
    change_column :questions, :views_count, :integer, default: 0
    change_column :questions, :rating, :integer, default: 0
    change_column :answers, :rating, :integer, default: 0
  end
end
