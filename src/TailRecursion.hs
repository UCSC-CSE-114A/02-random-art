{- | CMPS 112 : Programming Assignment 2

     Do not change the skeleton code!

     You may only replace the `error "TBD:..."` parts.

     For this assignment, you may use the following library functions:

     append (++)

 -}

module TailRecursion where

import Prelude hiding (lookup)

--------------------------------------------------------------------------------

{- | `assoc def key [(k1,v1), (k2,v2), (k3,v3);...])`

     searches the list for the first i such that `ki` = `key`.
     If such a ki is found, then vi is returned.
     Otherwise, if no such ki exists in the list, `def` is returned.

     ** your function should be tail recursive **
 -}

-- >>> assoc 0 "william" [("ranjit", 85), ("william",23), ("moose",44)])
-- 23
--
-- >>> assoc 0 "bob" [("ranjit",85), ("william",23), ("moose",44)]
-- 0

assoc :: Int -> String -> [(String, Int)] -> Int
assoc def key kvs = error "TBD:assoc"

--------------------------------------------------------------------------------
{- | `removeDuplicates ls`

     returns the list of elements of `ls` with all duplicates removed.
     The elements remaining in the list should have the same order as in `ls`. 
     A duplicate would be any occurance of an element in `ls` beyond the first.

     ** your `helper` should be tail recursive **

     for this problem only, you may use the library functions:

      * elem
 -}

-- >>> removeDuplicates [1,6,2,4,12,2,13,12,6,9,13]
-- [1,6,2,4,12,13,9]

removeDuplicates :: [Int] -> [Int]
removeDuplicates ls = reverse (helper [] ls)
  where
    helper :: [Int] -> [Int] -> [Int]
    helper seen []     = seen
    helper seen (x:xs) = helper seen' rest'
      where
        seen'          = error "TBD:helper:seen"
        rest'          = error "TBD:helper:rest"

--------------------------------------------------------------------------------
{- | `wwhile f x` such that `wwhile f x` returns a value `x'` obtained from the repeated application of the input function `f`.

`f` will always take in an input and return a tuple of a boolean and a result.
`wwhile` takes in such a function `f` and applies it to the given `x` returning
a boolean and a result. `wwhile` then keeps applying `f` to this new result
and each result after that until the boolean returned is false.
In which case, the result of the last call of `f` is returned.

For example:
Given a function `f x = (x < 10, x + 2)`, `wwhile f 8` will call `f 8` which will return `(True,10)`.
Since the boolean of `f 8` is true, `f 10` will be called and will return `(False,12)`.
Because the boolean from `f 10` is false, `wwhile f 8` will return `12`.

Once you have implemented the function,
you should get the following behavior:

```haskell
ghci> let f x = (x < 10, x+2) in wwhile f 3
11
ghci> let f x = let xx = x * x * x in (xx < 100, xx) in wwhile f 2
512
```

You can think of this function as repeatedly performing a given operation `f` on a given value `x`
until the conditional statement in `f`, whose value is the first item in the returned tuple, is `false`.
The second item in the returned tuple is the input for the next recursive call.
Thus, the final value will be `(false, <first value for which condition is no longer true>)`.

    ** your function should be tail recursive **
 -}

-- >> let f x = (x < 10, x + 2) in wwhile f 3
-- 13
-- >>> let f x = let xx = x * x * x in (xx < 100, xx) in wwhile f 2
-- 512

wwhile :: (a -> (Bool, a)) -> a -> a
wwhile f x = error "TBD:wwhile"

--------------------------------------------------------------------------------
{- | The **fixpoint** of a function `f` starting at `x`

The fixpoint of a function `f` is a point at which `f(x) = x`.

`fixpoint f x` returns the FIRST element of the sequence x0, x1, x2, ...

        x0 = x
        x1 = f x0
        x2 = f x1
        x3 = f x2
        .
        .
        .

      such that xn = f x_{n-1}

      That is,

      `fixpoint f x` should compute `f x` and then

      * IF x == f x then the fixpoint is `x`
      * OTHERWISE, the it is the (recursively computed) fixpoint of `f x`.

 -}

{- | Fill in the implementation of `fixpointL f x0` which returns

     the list [x_0, x_1, x_2, x_3, ... , x_n]

     where

       * x = x_0

       * f x_0 = x_1, f x_1 = x_2, f x_2 = x_3, ... f x_n = x_{n+1}

       * xn = x_{n+1}
  -}

fixpointL :: (Int -> Int) -> Int -> [Int]
fixpointL f x = error "TBD:fixpointL"

-- You should see the following behavior at the prompt:

-- >>> fixpointL collatz 1
-- [1]
-- >>> fixpointL collatz 2
-- [2,1]
-- >>> fixpointL collatz 3
-- [3,10,5,16,8,4,2,1]
-- >>> fixpointL collatz 4
-- [4,2,1]
-- >>> fixpointL collatz 5
-- [5,16,8,4,2,1]

-- >>> fixpointL g 0
-- [0, 1000000, 540302, 857553, 654289, 793480,701369,763959,722102,750418,731403,744238,735604,741425,737506,740147,738369,739567,738760,739304,738937,739184,739018,739130,739054,739106,739071,739094,739079,739089,739082,739087,739083,739086,739084,739085]
-- this is because cos 0.739085 is approximately 0.739085

g :: Int -> Int
g x = truncate (1e6 * cos (1e-6 * fromIntegral x))

collatz :: Int -> Int
collatz 1     = 1
collatz n
  | even n    = n `div` 2
  | otherwise = 3 * n + 1

--------------------------------------------------------------------------------
{- | Now refactor your implementation of `fixpointL` so that it just returns
     the LAST element of the list, i.e. the `xn` that is equal to `f xn`
  -}

fixpointW :: (Int -> Int) -> Int -> Int
fixpointW f x = wwhile wwf x
 where
   wwf        = error "TBD:fixpoint:wwf"

-- >>> fixpointW collatz 1
-- 1
-- >>> fixpointW collatz 2
-- 1
-- >>> fixpointW collatz 3
-- 1
-- >>> fixpointW collatz 4
-- 1
-- >>> fixpointW collatz 5
-- 1
-- >>> fixpointW g 0
-- 739085
