status = ['awake', 'tired'].sample

what_to_do = if status == "awake"
    "Be productive!"
  else
    "Go to sleep"
  end

puts what_to_do