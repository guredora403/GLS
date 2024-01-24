class CreateGeneratedContents < ActiveRecord::Migration[7.1]
  def change
    create_table :generated_contents do |t|
      t.references :prompt, null: false, foreign_key: true
      t.string :publisher
      t.string :text
      t.string :URL
      t.string :delete_password

      t.timestamps
    end
  end
end
