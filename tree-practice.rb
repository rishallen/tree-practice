class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def print_prefix(node)
  # base_case
  return if node == nil
  print node.value + " " # print contents of the string
  print_prefix(node.left) # starts recursion and then go left
  print_prefix(node.right) #go right
end

def print_postfix(node)
  # base_case
  return if node == nil
  print_postfix(node.left) # starts recursion and then go left
  print_postfix(node.right) #go right
  print node.value + " " # print contents of the string
end

def print_operaters(node)
  return if node == nil
  print_operaters(node.left)
  if node.left != nil || node.right != nil
    print node.value + " " # print contents of the string
  end
  print_operaters(node.right)
end


def print_non_operators(node)
  # get the count of nodes
  return if node == nil
  if node.left == nil && node.right == nil #if leaf
    return 1
  end
  return print_non_operators(node.left) + print_non_operators(node.right)
end

root = TreeNode.new("-")
root.left = TreeNode.new("+")
root.left.left = TreeNode.new("*")
root.left.left.left = TreeNode.new("4")
root.left.left.right = TreeNode.new("3")
root.left.right = TreeNode.new("2")
root.right = TreeNode.new("%")
root.right.right = TreeNode.new("5")
root.right.left = TreeNode.new("10")
# print_infix(root)

# print_prefix(root)
# print_postfix(root)
print_operaters(root)
puts print_non_operators(root)
