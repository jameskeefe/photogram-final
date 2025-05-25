class ChangeIntOnCommentsCount < ActiveRecord::Migration[7.1]
  def change
      change_column(:users, :comments_count, :integer, :using => 'comments_count::integer')
  end
end
