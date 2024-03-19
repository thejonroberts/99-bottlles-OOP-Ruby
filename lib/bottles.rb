# class Bottles
#   def song
#     verses(99, 0)
#   end

#   def verses(high, low)
#     array = high.downto(low).map do |number|
#       verse(number)
#     end
#     array.join("\n")
#   end

#   def verse(number)
#     phrase_one(number) + phrase_two(number - 1)
#   end

#   def phrase_one(number)
#     inflection = inflection(number)
#     number = number_phrase(number)
#     "#{number.to_s.capitalize} #{inflection} of beer on the wall, " +
#       "#{number} #{inflection} of beer.\n"
#   end

#   def phrase_two(number)
#     if number >= 0
#       "Take #{it_check(number)} down and pass it around, " +
#         "#{number_phrase(number)} #{inflection(number)} of beer on the wall.\n"
#     else
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     end
#   end

#   def number_phrase(number)
#     number == 0 ? "no more" : number
#   end

#   def inflection(beer_number)
#     beer_number == 1 ? "bottle" : "bottles"
#   end

#   def it_check(number)
#     number == 0 ? "it" : "one"
#   end
# end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map {|i| verse(i)}.join("\n")
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  def successor(bottle_number)
    if bottle_number == 0
      99
    else
      bottle_number - 1
    end
  end

  def action(bottle_number = :FIXME)
    if bottle_number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(bottle_number)} down and pass it around"
    end
  end

  def quantity(bottle_number = 0)
    if bottle_number == 0
      "no more"
    else
      bottle_number.to_s
    end
  end

  def container(bottle_number)
    if bottle_number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun(bottle_number = :FIXME)
    if bottle_number == 1
      'it'
    else
      'one'
    end
  end
end
