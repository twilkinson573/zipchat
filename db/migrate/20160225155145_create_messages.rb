class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :read, default: false

      t.references :user, index: true
      t.references :conversation, index: true

      t.timestamps
    end
  end
end
