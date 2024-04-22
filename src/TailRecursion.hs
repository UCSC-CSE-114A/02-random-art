{- | CSE114A: Programming Assignment 2

     See the README for instructions.
 -}

module TailRecursion where

import Prelude hiding (lookup,reverse)

--------------------------------------------------------------------------------

-- | `assoc def key [(k1,v1), (k2,v2), (k3,v3);...])`
--
--   searches the list for the first pair `(ki,vi)` such that `ki` = `key`.
--   If such a key `ki` is found, then `assoc` returns `vi`.
--   Otherwise, if no such key exists in the list, `assoc` returns the default value `def`.
--
--  ** Your implementation should be tail-recursive. **
--
-- >>> assoc 0 "owen" [("cormac", 85), ("owen",23), ("lindsey",44)])
-- 23
--
-- >>> assoc 0 "pikachu" [("cormac",85), ("owen",23), ("lindsey",44)]
-- 0

assoc :: Int -> String -> [(String, Int)] -> Int
assoc def key kvs = error "TBD: assoc"

--------------------------------------------------------------------------------

-- | Reverse the order of elements in a list; in other words,
--   `listReverseTR [x1, x2, ..., xn]` returns `[xn, ..., x2, x1]`.
--
-- ** Your implementation should be tail-recursive. **
--
-- >>> listReverseTR [1,2,3,4]
-- [4,3,2,1]
--
-- >>> listReverseTR ["i", "want", "to", "ride", "my", "bicycle"]
-- ["bicycle", "my", "ride", "to", "want", "i"]
--
-- >>> listReverseTR []
-- []

listReverseTR :: [a] -> [a]
listReverseTR xs = error "TBD: listReverseTR"

-- | Double every other integer in a list,
--   starting with the second element.
--
-- ** Your implementation should be tail-recursive. **
--
-- >>> doubleEveryOtherTR [8,7,6,5]
-- [8,14,6,10]
--
-- >>> doubleEveryOtherTR [1,2,3]
-- [1,4,3]
--
-- >>> doubleEveryOtherTR []
-- []

doubleEveryOtherTR :: [Integer] -> [Integer]
doubleEveryOtherTR xs = error "TBD: doubleEveryOtherTR"

-- | Sum the elements of a list of `Integer`s.
--
-- ** Your implementation should be tail-recursive. **
--
-- >>> sumListTR [1, 2, 3, 4]
-- 10
--
-- >>> sumListTR [1, -2, 3, 5]
-- 7
--
-- >>> sumListTR [1, 3, 5, 7, 9, 11]
-- 36

sumListTR :: [Integer] -> Integer
sumListTR xs = error "TBD: sumListTR"