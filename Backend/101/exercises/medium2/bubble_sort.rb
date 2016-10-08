def bubble_sort!(array)
  num = 0

  loop do 
   if array[num].to_s > array[num + 1].to_s
      temp = array[num]
      array[num] = array[num + 1]
      array[num + 1] = temp
    end
    num += 1
    break if num == 10
  end
  p array
end

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)