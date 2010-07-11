require 'spec_helper'

describe "singly linked list inspect" do

  before(:each) do
    @list = SinglyLinkedList.new
  end

  it "should create a new singly linked list" do
    @list.class.should == SinglyLinkedList
  end

  it "should perform find for a non existent value" do
    @list.find("fred").should == nil
  end

  it "should add a new value" do
    @list.add("fred")
    @list.find("fred").value.should == "fred"
  end

  it "should perform find for a non existent value after add" do
    @list.add("fred")
    @list.find("wilma").should == nil
  end

  it "should add values than list the entire list" do
    add_many(["fred", "wilma", "betty", "barney"])
    @list.values.should == ["fred", "wilma", "betty", "barney"]
  end

  it "should remove the first node" do
    add_many(["fred", "wilma", "betty", "barney"])
    @list.delete(@list.find("fred"))
    @list.values.should == [ "wilma", "betty", "barney"]
  end
  
  it "should remove a node" do
    add_many(["fred", "wilma", "betty", "barney"])
    @list.delete(@list.find("betty"))
    @list.values.should == [ "fred", "wilma", "barney"]
  end
  
  it "should remove the last value" do
    add_many(["fred", "wilma", "betty", "barney"])
    @list.delete(@list.find("barney"))
    @list.values.should == [ "fred", "wilma", "betty"]
  end
  
  def add_many(values)
    values.each do |v|
      @list.add(v)
    end
  end

end
