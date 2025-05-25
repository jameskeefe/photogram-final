class ChangeImageNullOnPhotos < ActiveRecord::Migration[7.1]
  def change
      change_column_null(:photos, :image, false)
  end
end
