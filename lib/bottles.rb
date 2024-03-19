# class Bottles
#   def song
#     verses(99, 0)
#   end

#   def verses(high, low)
#     array = high.downto(low).map do |count|
#       verse(count)
#     end
#     array.join("\n")
#   end

#   def verse(count)
#     phrase_one(count) + phrase_two(count - 1)
#   end

#   def phrase_one(count)
#     inflection = inflection(count)
#     number = number_phrase(count)
#     "#{number.to_s.capitalize} #{inflection} of beer on the wall, " +
#       "#{number} #{inflection} of beer.\n"
#   end

#   def phrase_two(count)
#     if count >= 0
#       "Take #{it_check(count)} down and pass it around, " +
#         "#{number_phrase(count)} #{inflection(count)} of beer on the wall.\n"
#     else
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     end
#   end

#   def number_phrase(count)
#     count == 0 ? "no more" : count
#   end

#   def inflection(beer_count)
#     beer_count == 1 ? "bottle" : "bottles"
#   end

#   def it_check(count)
#     count == 0 ? "it" : "one"
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
    case number
    when 0
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    else
      "#{number} #{container(number)} of beer on the wall, " +
      "#{number} #{container(number)} of beer.\n" +
      "Take #{pronoun(number)} down and pass it around, " +
      "#{quantity(number-1)} #{container(number - 1)} of beer on the wall.\n"
    end
  end

  def quantity(count = 0)
    if count == 0
      "no more"
    else
      count
    end
  end

  def container(count)
    if count == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun(count = :FIXME)
    if count == 1
      'it'
    else
      'one'
    end
  end
end
