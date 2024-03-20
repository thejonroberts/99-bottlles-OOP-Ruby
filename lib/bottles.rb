class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.for(number)
    klass = case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      BottleNumber
    end
    klass.new(number)
  end

  def to_s
    "#{quantity} #{container}"
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def quantity
    number.to_s
  end

  def container
    "bottles"
  end

  def pronoun
    'one'
  end
end

class BottleNumber0 < BottleNumber
  def action
    "Go to the store and buy some more"
  end

  def successor
    BottleNumber.for(99)
  end

  def quantity
    "no more"
  end
end

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end

  def pronoun
    'it'
  end
end

class BottleNumber6 < BottleNumber
  def container
    "six-pack"
  end

  def quantity
    1
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map {|i| verse(i)}.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)

    "#{bottle_number}".capitalize + " of beer on the wall, " +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor.to_s} of beer on the wall.\n"
  end

  def bottle_number_for(number)
    BottleNumber.for(number)
  end
end
