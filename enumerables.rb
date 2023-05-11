class MyList
  def initialize (*arg)
    @list = arg
  end

  def each
    return to_enum unless block_given?
    for x in @list do
      yield(x)
    end
  end
end