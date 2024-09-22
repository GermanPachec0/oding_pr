def cesar_cipher(_string, _shift)
  a = ''
  _string.each_byte do |value|
    encode = value + _shift
    encode = 64 + encode - 90 if encode > 90 && encode < 97
    encode = 96 + encode - 122 if encode > 122
    encode = value if value < 65 || value > 122 || value > 90 && value < 97
    a = encode.chr + a
  end
  a.reverse
end
