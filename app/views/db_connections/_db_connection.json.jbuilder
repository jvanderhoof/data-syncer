json.extract! db_connection, :id, :name, :database_name, :database_host, :database_user, :database_port, :type, :created_at, :updated_at
json.url db_connection_url(db_connection, format: :json)