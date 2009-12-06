require File.dirname(__FILE__) + '/../spec_helper'

describe BaseData do
  
  def base_data_instance(klass)
    "BaseData::#{klass.to_s.classify}".constantize.new
  end
  
  it "should disassemble ints" do
    base_data_instance(:int8).disassemble(bytes(1)).should == 1
    base_data_instance(:int16).disassemble(bytes(1,1)).should == 257
    base_data_instance(:int32).disassemble(bytes(1,1,1,1)).should == 16843009
    
    base_data_instance(:uint16).disassemble(bytes(1,1)).should == 257
    base_data_instance(:uint32).disassemble(bytes(1,1,1,1)).should == 16843009
    
    #FIXME
    base_data_instance(:uint64).disassemble(bytes(1,1,1,1,1,1,1,1)).should_not == 16843009
  end
  
  #it "should assemble ints" do
  #  base_data_instance(:int8).assemble(1).should == bytes(1)
  #  base_data_instance(:int8).assemble(255).should == bytes(255)
  #  base_data_instance(:int8).assemble(255).size.should == 1
  #  
  #  base_data_instance(:int8).assemble
  #end
  
end