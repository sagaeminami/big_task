class AddDetailsToContents < ActiveRecord::Migration[5.1]
  def change
    add_column :clones, :contents, :text
  end
end
