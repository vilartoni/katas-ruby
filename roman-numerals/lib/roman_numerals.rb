class RomanNumerals

  CONVERSION_MAPPING = [
    [1000, 'M'],
    [900, 'CM'],
    [500, 'D'],
    [400, 'CD'],
    [100, 'C'],
    [90, 'XC'],
    [50, 'L'],
    [40, 'XL'],
    [10, 'X'],
    [9, 'IX'],
    [5, 'V'],
    [4, 'IV'],
    [1, 'I']
  ]

  def encode(arabic)
    return '' if arabic.zero?

    decimal, numeral = CONVERSION_MAPPING.find { |decimal, _| arabic >= decimal }

    numeral + encode(arabic - decimal)
  end

end
