class BaseData::Int32 < BaseData::Base
  def self.struct_size; 4; end
  
  def disassemble(file_data)
    self.value = raw_from_file(file_data).unpack('c').first
  end
end