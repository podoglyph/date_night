require './lib/node.rb'
require 'pry'
require 'byebug'

class BinarySearchTree
  #the Node class should only need to access the score passed into BinarySearchTree as well as the root to determine @left @right
  attr_accessor :root

  def initialize
    @root = nil #this is the first score
    #@scores = [] #this represents every score that's passed in'
    @current = nil #this holds the current score being passed around
    @depth = 0
  end

  def insert(score)
    if 99 == score
    #  binding.pry
    end
    #base case zero nodes in tree
    #byebug
    if @root.nil?
      @root = Node.new(score)
    else
      #base case one node in tree
      if @root.left.nil? && @root.right.nil?
          if score < @root.score
            @root.left = Node.new(score)
          else
            @root.right = Node.new(score)
          end
          return
      end
      #base case two nodes in tree
      if @root.right == nil && score > @root.score
        @root.right = Node.new(score)
        return
      end

      if @root.left == nil && score < @root.score
        @root.left = Node.new(score)
        return
      end

      #three or more nodes in tree
      #binding.pry
      if score < @root.left.score
        @root = @root.left
        insert(score)
      else
        @root = @root.right
       # binding.pry
        insert(score)
      end
    end
  end
end

tree = BinarySearchTree.new
    scores = [33, 55, 21, 99]
    scores.each { |x| tree.insert(x) }