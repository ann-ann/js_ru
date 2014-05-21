class DeleteViewCountFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :views_count
  end
end
