class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

	t.string :'title:本のタイトル'
	t.string :'body:本の感想'

      t.timestamps
    end
  end
end
