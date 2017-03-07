include RSpec

require_relative "min_heap"

RSpec.describe MinHeap, type: Class do
  heap = MinHeap.new
  hacksawridge = Node.new("Hacksaw Ridge", 86)
  logan = Node.new("Logan", 93)
  dyinglaughing = Node.new("Dying Laughing", 80)
  nocturnalanimals = Node.new("Nocturnal Animals", 73)
  chronic = Node.new("Chronic", 76)
  getout = Node.new("Get Out", 99)

  describe "#insert data" do
    it "properly inserts a new node" do
      heap.insert(hacksawridge)
      heap.insert(logan)
      expect(hacksawridge.left.title).to eq "Logan"
    end

    it "properly adjusts heap based on min heap property" do
      heap.insert(nocturnalanimals)
      expect(nocturnalanimals.left.title).to eq "Hacksaw Ridge"
    end
  end

  describe "#delete data" do
    it "properly deletes the first node in the heap" do
      heap.delete
      expect(hacksawridge.left.title).to eq "Logan"
    end
  end

  describe "#print data" do
    specify {
      expected_output = "Nocturnal Animals: 73\nHacksaw Ridge: 86\nLogan: 93\n"
      heap.insert(nocturnalanimals)
      heap.print
      expect { heap.print }.to output(expected_output).to_stdout
    }
  end

  describe "#find data" do
    it "successfully retrieves top element in heap" do
      expect(heap.find.title).to eq "Nocturnal Animals"
    end
  end
end
