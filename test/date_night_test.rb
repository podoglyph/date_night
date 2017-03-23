require 'minitest/autorun'
require 'minitest/pride'
require './lib/date_night.rb'
require './lib/node.rb'
require 'pry'

class DateNightTest < Minitest::Test
  
  def test_binary_search_tree_class_exists
    tree = BinarySearchTree.new

    refute_equal nil, tree 
  end

  def test_first_insert_creates_root_node
    tree = BinarySearchTree.new
    tree.insert(95, "title")
    
    refute_equal nil, tree.root
    assert_equal 95, tree.root.score
  end

  def test_lesser_value_goes_left_with_one_node
    tree = BinarySearchTree.new
    tree.insert(95, "title")
    tree.insert(30, "title")
    
    refute tree.root.left.nil?
    assert_equal 30, tree.root.left.score 
  end

  def test_greater_value_goes_right_with_one_node
    tree = BinarySearchTree.new
    tree.insert(44, "title")
    tree.insert(67, "title")
    
    refute tree.root.right.nil?
    assert_equal 67, tree.root.right.score
  end

  def test_lesser_value_goes_left_with_two_nodes
    tree = BinarySearchTree.new
    tree.insert(33, "title")
    tree.insert(55, "title")
    tree.insert(21, "title")
    
    refute tree.root.left.nil?
    assert_equal 21, tree.root.left.score 
  end

  def test_greater_value_goes_right_with_two_nodes
    tree = BinarySearchTree.new
    tree.insert(80, "title")
    tree.insert(67, "title")
    tree.insert(85, "title")
    
    refute tree.root.right.nil?
    assert_equal 85, tree.root.right.score
  end

  def test_recursive_insertion
    tree = BinarySearchTree.new
    scores = [33, 55, 21, 99, 44, 31, 77, 36, 47, 62, 100]
    scores.each { |x| tree.insert(x, "title") }
    #binding.pry
    assert_equal 100, tree.root.right.score
  end

  # def test_include_method
  #   tree = BinarySearchTree.new
  #   scores = [33, 55, 21, 99, 44, 31, 77, 36, 47, 62, 100]
  #   scores.each { |x| tree.insert(x, "title") }
  #   tree.include?(55)
  #   #binding.pry
  #   assert true, tree.include?(score)
  # end
  

end