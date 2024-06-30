class CountdownSong
  attr_reader :verse_template, :max, :min

  def initialize(verse_template:, max: 999_999, min: 0)
    @verse_template = verse_template
    @max = max
    @min = min
  end

  def song
    verses(max, min)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

class BottleVerse
  def self.lyrics(number)
    bottle_number = BottleNumber.for(number)
    new(bottle_number).lyrics
  end

  attr_reader :bottle_number

  def initialize(bottle_number)
    @bottle_number = bottle_number
  end

  def lyrics
    "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action}, " +
      "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  def self.for(number)
    registry.find { |candidate| candidate.handles?(number) }.new(number)
  end

  def self.registry
    @registry ||= [BottleNumber]
  end

  def self.register(candidate)
    registry.prepend(candidate)
  end

  # use inherited hook to register all subclasses
  def self.inherited(candidate)
    register(candidate)
  end

  def self.handles?(_number)
    true
  end

  # NOTE: simpler factory
  # def self.for(number)
  #   case number
  #   when 0
  #     BottleNumber0
  #   when 1
  #     BottleNumber1
  #   when 6
  #     BottleNumber6
  #   else
  #     BottleNumber
  #   end.new(number)
  # end

  attr_reader :number

  def initialize(number)
    @number = number
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
    'bottles'
  end

  def pronoun
    'one'
  end
end

class BottleNumber0 < BottleNumber
  def self.handles?(number)
    number == 0
  end

  def action
    'Go to the store and buy some more'
  end

  def successor
    BottleNumber.for(99)
  end

  def quantity
    'no more'
  end
end

class BottleNumber1 < BottleNumber
  def self.handles?(number)
    number == 1
  end

  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end

class BottleNumber6 < BottleNumber
  def self.handles?(number)
    number == 6
  end

  def container
    'six-pack'
  end

  def quantity
    1
  end
end
