#let diffeq(nums, symbol) = {

  let n = nums.len()
  let p(repeat) = repeat*"'"

  for x in range(nums.len()){

    n -= 1

    let term = $#nums.at(x)#symbol#p(n)$

    if nums.at(x) == 1 or nums.at(x) ==-1 {
      if x == 0 {
        if nums.at(x) > 0 {
          $#symbol#p(n)$
        } else { $-#symbol#p(n)$ }
      } else {
        if nums.at(x) > 0 {
          $+ #symbol#p(n)$
        } else { $-#symbol#p(n)$ }
      }
    } else if nums.at(x) > 0 {
      if x==0 {term} else {$+ #term$}
    } else if nums.at(x) < 0 {
      term
    }
    else {none}

  }

}
