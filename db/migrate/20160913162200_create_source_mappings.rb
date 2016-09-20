class CreateSourceMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :source_mappings do |t|
      t.string :name
      t.integer :source_id
      t.integer :destination_id

      t.timestamps
    end

  end
end
