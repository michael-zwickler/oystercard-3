class Oystercard
  attr_reader:balance

  def initialize
    @balance = 0
  end

  def add_balance(num)
    @balance = @balance + num
  end
end