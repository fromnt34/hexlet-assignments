class RenameCommentToBodyInPostComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :post_comments, :comment, :body
  end
end
