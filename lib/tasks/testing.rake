class Hash
  def join(new_key, keys, joiner='')
    self[new_key] = keys.map{|k| self[k]}.join(joiner)
    self
  end
end

class Mapper
  def self.column_keys
    mapping.map{|hsh| hsh[:to]}
  end
end

class TransformationMapper < Mapper
  def self.mapping
    [
      { from: 'id', to: 'ID' },
      { from: ['firstname', 'lastname'], to: 'Full Name', join: ' '},
      { from: ['address1', 'address2'], to: 'Address', join: ', ' },
      { from: 'updated_at', to: 'Updated At' }
    ]
  end
end

class Transformer
  require 'active_support/inflector'

  def self.transform(input, mapping)
    include Transproc::Helper

    # perform joins
    fn = Transproc(:map_array, Transproc(:stringify_keys))
    mapping.select {|hsh| hsh.has_key?(:join) }.each do |transformation|
      fn = fn.>> Transproc(:map_array, -> h { h.join(transformation[:to], transformation[:from], transformation[:join])} )
    end

    # rename changed keys
    mapping.select{|hsh| hsh[:from].is_a?(String) && hsh[:from] != hsh[:to] }.each do |transformation|
      puts transformation.inspect
      #fn = fn.>> Transproc(:map_array, Transproc(:symbolize_keys))
      fn = fn.>> Transproc(:map_array, Transproc(:rename_keys, { transformation[:from] => transformation[:to] }))
    end

    # included only mapped fields
    fn = fn.>> Transproc(:map_array, Transproc(:accept_keys, mapping.map{|hsh| hsh[:to]} ))

    fn.call(input)
  end
end

namespace :testing do
  def show(item)
    puts item.inspect
  end

  task db: :environment do
    db = DbConnection.first
    #puts db.table_list.inspect
    #puts db.table_columns('spree_addresses').inspect
    puts db.load_data('spree_addresses').to_json

    CsvFile.new('temp.csv').write(
      TransformationMapper.column_keys,
      Transformer.transform(
        db.load_data('spree_addresses'),
        TransformationMapper.mapping
      )
    )
  end
end
