# Singly-Linked List
class LinkedList


# setters and getters for head, tail
    attr_accessor :head

    attr_accessor :tail
# setters and getters for head, tail	

# constructor
    def initialize
        @head = nil
        @tail = nil
    end
# constructor	

# purge function (reset, make empty)	
    def purge
        @head = nil
        @tail = nil
    end	
# purge function (reset, make empty)		






# isempty? function
    def empty?
        @head.nil?
    end
# isempty? function	






    def first
	raise "ContainerEmpty" if @head.nil?
        @head.datum
    end

    def last
	raise "ContainerEmpty" if @tail.nil?
        @tail.datum
    end



    def prepend(item)
        tmp = Element.new(self, item, @head)
	@tail = tmp if @head.nil?
        @head = tmp
    end
	
    def append(item)
        tmp = Element.new(self, item, nil)
        if @head.nil?
            @head = tmp
        else
            @tail.succ = tmp
		end
        @tail = tmp
    end	


    def clone
        result = LinkedList.new
        ptr = @head
        while not ptr.nil?
            result.append(ptr.datum)
            ptr = ptr.succ
		end
        result
    end
	
	
    def extract(item)
        ptr = @head
        prevPtr = nil
        while not ptr.nil? and not ptr.datum.equal?(item)
            prevPtr = ptr
            ptr = ptr.succ
		end
	raise "ArgumentError" if ptr.nil?
        if ptr == @head
            @head = ptr.succ
        else
            prevPtr.succ = ptr.succ
		end
        if ptr == @tail
            @tail = prevPtr
		end
    end	



# class Element definition
    class Element

        def initialize(list, datum, succ)
            @list = list
            @datum = datum
            @succ = succ
		end

	attr_accessor :datum

	attr_accessor :succ
	
	
        def insertAfter(item)
            @succ = Element.new(@list, item, @succ)
            if @list.tail.equal?(self)
                @list.tail = @succ
			end
		end
		
        def insertBefore(item)
            tmp = Element.new(@list, item, self)
            if @list.head.equal?(self)
                @list.head = tmp
            else
                prevPtr = @list.head
                while not prevPtr.nil? \
                        and not prevPtr.succ.equal?(self)
                    prevPtr = prevPtr.succ
				end
                prevPtr.succ = tmp
			end
		end		


	

    end
# class Element definition



end