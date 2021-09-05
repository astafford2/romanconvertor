def fromRoman(romanNumber)
    valid_characters = "I V X L C D M"
    roman_valid = true
    romanNumber.each_char {|ch|
        unless valid_characters.include?(ch)
            roman_valid = false
        end
    }

    rules = {
      "M" => 1000,
      "D" => 500,
      "C" => 100,
      "L" => 50,
      "X" => 10,
      "V" => 5,
      "I" => 1
    }

    if roman_valid
        arabic = 0

        (0..romanNumber.size - 2).each { |i|
            if rules[romanNumber[i]] >= rules[romanNumber[i + 1]]
                arabic += rules[romanNumber[i]]
            else
                arabic -= rules[romanNumber[i]]
            end
        }

        return arabic + rules[romanNumber[romanNumber.size-1]]
    else
        raise TypeError
    end
end

def toRoman(arabicNumber)
    rules = {
      1000 => "M",
      900 => "CM",
      500 =>  "D",
      400 => "CD",
      100 =>  "C",
      90 =>  "XC",
      50 =>   "L",
      40 =>  "XL",
      30 => "XXX",
      20 =>  "XX",
      10 =>   "X",
      9 =>   "IX",
      5 =>    "V",
      4 =>   "IV",
      1 => "I",
    }

    if arabicNumber >= 1 && arabicNumber <= 3999
        roman = ""
        val = arabicNumber

        while val > 0
            rules.keys.each do |num|
                if val >= num
                    val -= num
                    roman << rules[num]
                    break
                end
            end
        end

        return roman
    else
        raise RangeError
    end
end