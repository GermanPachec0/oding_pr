def merge(left_arr, right_arr)
  arr_resultado = []

  while left_arr.length > 0 && right_arr.length > 0
    if left_arr[0] > right_arr[0]
      arr_resultado.push(right_arr[0])
      right_arr.shift
    else
      arr_resultado.push(left_arr[0])
      left_arr.shift
    end
  end

  while left_arr.length > 0
    arr_resultado.push(left_arr[0])
    left_arr.shift
  end

  while right_arr.length > 0
    arr_resultado.push(right_arr[0])
    right_arr.shift
  end

  arr_resultado
end

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2

  left = arr[0...mid]
  right = arr[mid..-1]

  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  merge(sorted_left, sorted_right)
end

p merge_sort([105, 79, 100, 110])
