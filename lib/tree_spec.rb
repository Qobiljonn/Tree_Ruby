require_relative 'tree'
require 'rspec'

describe Tree do
  describe ".printTree" do
    before(:all) do
      Tree.printTree("5","tree.txt")
      file = File.open("tree.txt","r")
      @file_data = file.readlines.map(&:chomp)
    end
    it 'height of the tree is 5' do
      expect(@file_data.length - 3).to eq(5)
    end
    it 'should print W for height 5' do
      first_row = @file_data[0]
      expect(first_row).to eq("         W")
    end
    it 'should print * under W for height 5' do
      second_row = @file_data[1]
      expect(second_row).to eq("         *")
    end
    it 'should print @ before the even row' do
      expect(@file_data[2]).to eq("      @*****")
      expect(@file_data[4]).to eq("  @*************")
    end
    it 'should print @ after the odd row' do
      expect(@file_data[3]).to eq("    *********@")
      expect(@file_data[5]).to eq("*****************@")
    end
    it 'should print TTTTT in last 2 rows' do
      expect(@file_data[6]).to eq("      TTTTT")
      expect(@file_data[7]).to eq("      TTTTT")
    end
  end
end