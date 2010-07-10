class Dependencies

    def initialize
      @dependencies = {}
      @visited_dependencies = []
    end
    
		def add_direct(node, dependencies)
      @dependencies[node] = dependencies
		end
		
		def dependencies_for(node)
		  @visited_dependencies.clear
	    recursive_search(node)
	    @visited_dependencies.sort
	  end
	  
	  def recursive_search(node)
		  @dependencies[node].each do |dependencie|
		    if !@visited_dependencies.include? dependencie
		      @visited_dependencies << dependencie
		      if @dependencies[dependencie]
		        recursive_search(dependencie)
	        end
	      end
		  end
		end
end

