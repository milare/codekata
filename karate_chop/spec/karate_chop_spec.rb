require 'spec_helper'

describe "karate chop inspect" do

  it "value not found in an empty array" do
    KarateChop.chop(1,[]).should == -1
  end

  it "value not found in a filled array" do
    KarateChop.chop(1,[2,3,4]).should == -1
  end
  
  it "value found in an array with one value" do
    KarateChop.chop(1,[1]).should == 0
  end
  
  it "greater value not found in an array with one value" do
    KarateChop.chop(10,[1]).should == -1
  end
  
  it "lower value not found in an array with one value" do
    KarateChop.chop(10,[15]).should == -1
  end
  
  it "first value found in a filled array" do
    KarateChop.chop(1, [1,3,5,7,8,9]).should == 0
  end


  it "middle value found in a filled array" do
    KarateChop.chop(8, [1,3,5,7,8,9,13]).should == 4
  end
  
  it "very middle value found in a filled array" do
    KarateChop.chop(7, [1,3,5,7,8,9,13]).should == 3
  end
  
  it "last value found in a filled array" do
    KarateChop.chop(9, [1,3,5,7,8,9]).should == 5
  end
  
end
