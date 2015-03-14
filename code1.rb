# Driver program sample for LinkedList class
require 'C:\rubycode\LinkedList.rb'

l = LinkedList.new

#raise "error1"

puts l.empty?

l.prepend("H")
l.append(4)
puts l.first
puts l.last

h=l.clone
puts h.first
puts h.last

h.extract(4)
puts h.first
puts h.last