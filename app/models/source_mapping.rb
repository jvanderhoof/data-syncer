class SourceMapping < ApplicationRecord
  belongs_to :source, class_name: 'DbConnection'
  #belongs_to :destination, class_name: 'CsvFile'
end
