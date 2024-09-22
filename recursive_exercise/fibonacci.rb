def fibonacci
  arr = [0, 1]
  init = 2
  while init < 8
    arr.push(arr[init - 1] + arr[init - 2])
    init += 1
  end
  arr
end

def fibo_recursivly(init = 2, arr = [])
  arr.push(0, 1) if arr.empty?

  return arr if init >= 8

  arr.push(arr[init - 1] + arr[init - 2])
  init += 1
  fibo_recursivly(init, arr)
end

puts fibo_recursivly
