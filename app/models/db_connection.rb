require 'transproc/array'

class DbConnection < ApplicationRecord

  include Transproc::Helper

  def table_list
    fn = transform >> t(:extract_key, :tablename)
    fn.call(query('SELECT * FROM pg_catalog.pg_tables order by tablename')).delete_if {|i| i.match(/^pg_/)}
  end

  def tables_and_columns
    {}.tap do |rtn_hsh|
      table_list.sort.each do |table|
        rtn_hsh[table] = table_columns(table)
      end
    end
  end

  def table_columns(table)
    transform.call(
      query("select column_name, data_type, character_maximum_length from INFORMATION_SCHEMA.COLUMNS where table_name = '#{table}'")
    )
  end

  def load_data(table, columns=['*'], limit=1000)
    transform.call(
      query("select #{columns.join(',')} from #{table} limit #{limit}" )
    )
  end

  private

  def transform
    t(:map_array, t(:symbolize_keys))
  end

  def query(sql)
    conn = PG::Connection.open(
      dbname: database_name,
      host: database_host,
      user: database_user,
      port: database_port,
      connect_timeout: 2
    )
    result = conn.exec(sql)
    conn.close
    result
  end

end
