class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.string :publisher
      t.string :title
      t.string :description
      t.string :prompt_text
      t.string :delete_password
      t.integer :view_count

      t.timestamps
    end
  end
end
