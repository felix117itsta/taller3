class AddReviewDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :reviewDate, :date
  end
end
