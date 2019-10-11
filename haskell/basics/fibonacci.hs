module Fibonacci where

  fib :: Integer -> Integer
  fib x 
    | x > 1 = fib (x - 1) + fib (x - 2)
    | otherwise = 1
