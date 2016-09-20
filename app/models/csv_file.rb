require 'csv'

class CsvFile

  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read; end

  def write(keys, array)
    CSV.open(file_path, "wb") do |csv|
      csv << keys
      array.each do |row|
        row_values = keys.map {|key| row[key] }
        csv << row_values
      end
    end
  end

end
