def substrings(string, dictionary)
  words = Hash.new(0)
  arr_split = string.split
  dictionary.each do |value|
    arr_split.each do |value2|
      if value2.include?(value)
        words[value] += 1
        puts value
      end
    end
  end
  words
end
