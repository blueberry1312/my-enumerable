require './my_enumerable'

class MyList
include MyEnumerable

  def initialize(*arg)
    @list = arg
  end

  def each
    return to_enum unless block_given?

    for x in @list do
      yield(x)
    end
  end
end

# Create new List

list = MyList.new(1, 2, 3, 4)

# Test methods

all_true_numbers = list.all? {|e| e < 5}
all_false_numbers = list.all? {|e| e > 5}
any_true_two = list.any? {|e| e == 2}
any_false_five = list.any? {|e| e == 5}
even_numbers = list.filter {|e| e.even?}

# Output Tests

puts <<~TEXT
  All < 5: #{all_true_numbers}
  All > 5: #{all_false_numbers}
  Any 2: #{any_true_two}
  Any 5: #{any_false_five}
  Even numbers found: #{even_numbers}
TEXT
