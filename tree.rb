=begin
This program constructs christmas tree and stores it in the .txt file in the given location
=end

# method to validate user input for height
def getTreeHeight
  loop do
    puts "Enter the height of the christmas tree: "
    height = gets.chomp.to_i
    if height > 0
      return height
    end
  end
end

# method to validate user input for filepath
def getTreePath
  isOpen = false
  until isOpen == true
    puts "Enter the valid path to the file(if no such file exists, it will be created)"
    filePath = gets.chomp
    isOpen = File.file?(filePath)
  end
  return filePath
end

# method to print out tree
def printTree(height,filepath)
  File.open(filepath,"w") do |treeFile|  # txt file where the tree will be printed

    (height - 1).times{treeFile.write("  ")}
  treeFile.write(" W")
  treeFile.write("\n")
  for row in 1..height

    if row == 1
      (height - row).times{treeFile.write("  ")}
      treeFile.write" *"
      treeFile.write("\n")
    elsif row % 2 == 0 # "@" symbol must be on the left side for the lines on the even positions
      (height - row).times{treeFile.write("  ")}
      treeFile.write("@")
      (row).times{treeFile.write("*")}
      (row - 1).times{treeFile.write("***")}
      treeFile.write("\n")
    else # "@" on the right for odd lines
      (height - row).times{treeFile.write("  ")}
      (row).times{treeFile.write("*")}
      (row - 1).times{treeFile.write("***")}
      treeFile.write("@")
      treeFile.write("\n")
    end
  end
  for index in 0..1
    ((((height - 1) * 4) - 4) / 2 ).times{treeFile.write(" ")} # calculation to place TTTTT under the tree in the center
    treeFile.write("TTTTT")
    treeFile.write("\n")
  end
  end
end

printTree(getTreeHeight,getTreePath)
