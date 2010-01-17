#TODO: Find out how the game handles max-length strings
#0-bytes used as end-marker, or just padding?
class BaseData::StringCollection < BaseData::Base
  attr_accessor :parent_struct
  attr_accessor :strings
  delegate :[],:size, :to => :strings
  
  def initialize(strings = [])
    self.strings = strings
  end
  
  #SERIOUSLY DON'T FUCK WITH THIS BECAUSE OTHERWISE THINGS DON'T ASSEMBLE PROPERLY
  def value
    #BaseData::PlainString.clean_value(self.strings.map(&:value).join)
    string = self.strings.map(&:value).join
    #string.metaclass.instance_eval do
      def string.clean_value
        BaseData::String.clean_value(self)
      end
    #end
    #debugger
    string
  end
  
  #TODO: This only works for plain strings, disgaea strings need their own
  def value=(new_value)
    new_value = new_value[0...(self.strings.size)] + 0.chr #limit the size, add 0-byte
    new_value.bytes.each_with_index do |byte,index|
      self.strings[index].value = byte.chr
    end
  end
  
  def as_raw
    #FIXME: Need to pad it out to the full length
    value
  end
  
end