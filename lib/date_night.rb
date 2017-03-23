require './lib/node.rb'
require 'pry'
require 'byebug'

class BinarySearchTree
  
  attr_accessor :root, :path, :tree

  def initialize
    @root = nil
    @current = nil
    @depth = 0
    @path = nil
  end

  def insert(score, title)
    #base case zero nodes in tree
    if @root.nil?
      @root = Node.new(score, title)
    else
      #base case one node in tree
      if @root.left.nil? && @root.right.nil?
          if score < @root.score
            @root.left = Node.new(score, title)
          else
            @root.right = Node.new(score, title)
          end
          return
      end
      #base case two nodes in tree
      if @root.right == nil && score > @root.score
        @root.right = Node.new(score, title)
        return
      elsif @root.left == nil && score < @root.score
        @root.left = Node.new(score, title)
        return
      end

      #three or more nodes in tree
      #binding.pry

      if score < @root.score
        @root = @root.left
        insert(score, title)
      elsif score > @root.score
        @root = @root.right
        #binding.pry
        insert(score, title)
      end
    end
  end

  # def include?(score)
  #   if score == @root.score
  #     return true
  #   else
  #     if score < @root.score
  #     @root = @root.left.score
  #     include?(score)
  #     else
  #     @root = @root.right.score
  #     include?(score)
  #     end
  #   end
  # end

  # def load(path)
  #   movies = []
  #   movies = IO.readlines(path)
  #   movies.each do |x|
  #   movie_score = x[0..1]
  #   movie_title = x[4..-1]
  #   tree.insert(movie_score, movie_title)
  #   end
  # end
  
end

tree = BinarySearchTree.new

movies = []
movies = IO.readlines("./lib/movies.txt")
movies.each do |x|
  movie_score = x[0..1]
  movie_title = x[4..-1]
  tree.insert(movie_score, movie_title)
end

#tree.load("./lib/movies.txt")