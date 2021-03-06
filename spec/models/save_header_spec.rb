require File.dirname(__FILE__) + '/../spec_helper'

describe SaveHeader do
  
  before do
    @file = File.open(RAILS_ROOT+'/spec/fixtures/save_header.bin')
    @save_header = SaveHeader.new
  end
  
  def disassembled
    @disassembled ||= @save_header.disassemble(@file)
    @disassembled
  end
  
  it "should disassemble" do
    disassembled.should be_an_instance_of SaveHeader
  end
  
  it "should extract checksum" do
    disassembled.should have(8).checksum_maybe
    disassembled.checksum_maybe.first.should be_an_instance_of BaseData::Int8
  end
  
  it "should extract timestamp" do
    disassembled.timestamp_struct.should be_an_instance_of BaseData::TimeStamp
    disassembled.timestamp.hours.should equal 67
    disassembled.timestamp.minutes.should equal 1
    disassembled.timestamp.seconds.should equal 33
  end
  
  it "should extract name" do
    disassembled.name_struct.should be_an_instance_of BaseData::StringCollection
    disassembled.name.size.should equal 31
    disassembled.name.strip.should == 'Adell'
  end
  
  it "should extract level" do
    disassembled.level_struct.should be_an_instance_of BaseData::Int16
    disassembled.level.should equal 113
  end
  
  it "should extract chapter" do
    disassembled.chapter_struct.should be_an_instance_of BaseData::Int8
    disassembled.chapter.should equal 9
  end
end