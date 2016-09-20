class CreateDbConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :db_connections do |t|
      t.string :name
      t.string :database_name
      t.string :database_host
      t.string :database_user
      t.string :database_port
      t.string :type

      t.timestamps
    end
  end
end
