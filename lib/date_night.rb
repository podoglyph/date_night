require './lib/node.rb'
require 'pry'
require 'byebug'

class BinarySearchTree
  
  attr_accessor :root

  def initialize
    @root = nil
    @current = nil
    @depth = 0
  end

  def insert(score)
    #base case zero nodes in tree
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
      elsif @root.left == nil && score < @root.score
        @root.left = Node.new(score)
        return
      end

      #three or more nodes in tree
      #binding.pry

      if score < @root.score
        @root = @root.left
        insert(score)
      elsif score > @root.score
        @root = @root.right
        #binding.pry
        insert(score)
      end
    end
  end
end

tree = BinarySearchTree.new
scores = [33, 55, 21, 99, 44, 31, 77, 36, 47, 62, 100, 1, 3, 5, 7, 9, 11, 13]
scores.each { |x| tree.insert(x) }