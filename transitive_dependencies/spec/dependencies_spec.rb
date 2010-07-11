require 'spec_helper'

describe "transitive dependencies inspect" do

  it "should create a new set of dependencies" do
    Dependencies.new.class.should == Dependencies
  end

  it "should create a node with single dependencies" do
    dep = Dependencies.new
    dep.add_direct('A', %w{ B C })
    dep.dependencies_for('A').should == %w{ B C }
  end

  it "should create a node with dependent dependencies" do
    dep = Dependencies.new
    dep.add_direct('A', %w{ B C })
    dep.add_direct('B', %w{ D })
    dep.dependencies_for('A').should == %w{ B C D }
  end

  it "should do the master test" do
    dep = Dependencies.new
    dep.add_direct('A', %w{ B C } )
    dep.add_direct('B', %w{ C E } )
    dep.add_direct('C', %w{ G   } )
    dep.add_direct('D', %w{ A F } )
    dep.add_direct('E', %w{ F   } )
    dep.add_direct('F', %w{ H   } )
    dep.dependencies_for('A')
    dep.dependencies_for('D')
    dep.dependencies_for('B').should == %w{ C E F G H }
  end
end
