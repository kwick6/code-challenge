ENGLISH_VALUE = {}
%w| zero one two three four five six seven eight nine ten eleven
    twelve thirteen fourteen fifteen sixteen seventeen eighteen
    nineteen |.each_with_index{ |word,i| ENGLISH_VALUE[word] = i }

%w| zero ten twenty thirty forty fifty sixty seventy eighty
    ninety|.each_with_index{ |word,i| ENGLISH_VALUE[word] = i*10 }
ENGLISH_VALUE['hundred'] = 100
%w| one thousand million billion trillion|.each_with_index{ |word,i|
  ENGLISH_VALUE[word] = 10**(i*3)
}

class Integer
  def self.from_english( words )
    values = words.downcase.split( /\W+/ ).map{ |word|
      ENGLISH_VALUE[word]
    }
    # Put your magic here
  end
end

TESTS = {
  'one'=>1,
  'seventy three'=>73,
  'ninety nine'=>99,
  'one hundred'=>100,
  'one hundred one'=>101,
  'one hundred twenty'=>120,
  'three hundred sixty four'=>364,
  'eight thousand five'=>8_005,
  'forty-three thousand twelve'=>43_012,
  'two billion one hundred thousand seventeen'=>2_000_100_117
}

TESTS.each{ |word,expected_value|
  actual_value = Integer.from_english( word )
  unless actual_value == expected_value
    warn "From '#{word}', " <<
         "expected: #{expected_value}, " <<
         "actual: #{actual_value.inspect}"
  end
}

