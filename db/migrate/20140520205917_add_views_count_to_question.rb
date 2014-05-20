class AddViewsCountToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :views_count, :integer
  end
end
