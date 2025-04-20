import Test.Tasty
import Common
import TailRecursion
import RandomArt

main :: IO ()
main = runTests [ unit1 ]

unit1 :: Score -> TestTree
unit1 sc = testGroup "Unit 1"
  [ mkTest
      (assoc 0 "owen")
      [("cormac", 85), ("owen",23), ("lindsey",44)]
      23
      3.75
      "assoc 0"
  , mkTest
      (assoc 0 "pikachu")
      [("cormac", 85), ("owen",23), ("lindsey",44)]
      0
      3.75
      "assoc 1"
  , mkTest
      (assoc 0 "cormac")
      [("cormac", 85), ("owen",23), ("lindsey",44), ("cormac",9)]
      85
      3.75
      "assoc 2"
  , mkTest
      (assoc 0 "bob")
      [("cormac", 85), ("owen",23), ("lindsey",44), ("cormac",9)]
      0
      3.75
      "assoc 3"
  , mkTest
      listReverseTR
      [1, 2, 3, 4]
      [4, 3, 2, 1]
      5
      "listReverseTR 1"
  , mkTest
      listReverseTR
      ["a", "b", "c", "d"]
      ["d", "c", "b", "a"]
      5
      "listReverseTR 2"
  , mkTest
      listReverseTR
      ([] :: [Integer])
      []
      5
      "listReverseTR 3"
  , mkTest
      doubleEveryOtherTR
      [8,7,6,5]
      [8,14,6,10]
      5
      "doubleEveryOtherTR 1"
  , mkTest
      doubleEveryOtherTR
      [1,2,3]
      [1,4,3]
      5
      "doubleEveryOtherTR 2"
  , mkTest
      doubleEveryOtherTR
      []
      []
      5
      "doubleEveryOtherTR 3"
  , mkTest
      sumListTR
      []
      0
      2
      "sumListTR 1"
  , mkTest
      sumListTR
      [1, 2, 3, 4]
      10
      2
      "sumListTR 2"
  , mkTest
      sumListTR
      [1, -2, 3, 5]
      7
      2
      "sumListTR 3"
  , mkTest
      sumListTR
      [1, 3, 5, 7, 9, 11]
      36
      2
      "sumListTR 4"
  , mkTest
      sumListTR
      [1..10000000]  -- This is intended to overflow the stack if `sumListTR` is not tail-recursive
      50000005000000
      2
      "sumListTR 5"
  , mkTest
      exprToString
      sampleExpr0
      "sin(pi*((x+y)/2))" 
      3.75
      "exprToString 0"
  , mkTest
      exprToString
      sampleExpr1
      "(x<y?x:sin(pi*x)*cos(pi*((x+y)/2)))"
      3.75
      "exprToString 1"
  , mkTest
      exprToString
      sampleExpr2
      "(x<y?sin(pi*x):cos(pi*y))"
      3.75
      "exprToString 2"
  , mkTest
      exprToString
      sampleExpr3
      "cos(pi*sin(pi*cos(pi*((cos(pi*x)+cos(pi*cos(pi*((y*y+cos(pi*x))/2)))*cos(pi*sin(pi*cos(pi*y))*((sin(pi*x)+x*x)/2)))/2))*y))"
      3.75
      "exprToString 3"
  , mkTest
      (depth . build)
      4
      4
      2
      "build depth check 1"
  , mkTest
      (depth . build)
      6
      6
      2
      "build depth check 2"
  , mkTestIO
      (emitGray "sample.png" 150)
      sampleExpr3
      ()
      5.5
      "eval 1"
  , mkTestIO
      (emitGray "sample2.png" 150)
      sampleExpr2
      ()
      5.5
      "eval 2"
  , mkTestIO
      (emitRandomGray 150)
      g1
      ()
      3
      "gray 1"
  , mkTestIO
      (emitRandomGray 150)
      g2
      ()
      3
      "gray 2"
  , mkTestIO
      (emitRandomGray 150)
      g3
      ()
      3
      "gray 3"
  , mkTestIO
      (emitRandomColor 150)
      c1
      ()
      4
      "color 1"
  , mkTestIO
      (emitRandomColor 150)
      c2
      ()
      3
      "color 2"
  , mkTestIO
      (emitRandomColor 150)
      c3
      ()
      4
      "color 3"
  ]
  where
    mkTest :: (Show b, Eq b) => (a -> b) -> a -> b -> Double -> String -> TestTree
    mkTest f = scoreTest' sc (return . f)

    mkTestIO :: (Show b, Eq b) => (a -> IO b) -> a -> b -> Double -> String -> TestTree
    mkTestIO = scoreTest' sc

-- Used for testing the `build` function
depth :: Expr -> Int
depth VarX                 = 0
depth VarY                 = 0
depth (Sine e)             = 1 + depth e
depth (Cosine e)           = 1 + depth e
depth (Average e1 e2)      = 1 + max (depth e1) (depth e2)
depth (Times e1 e2)        = 1 + max (depth e1) (depth e2)
depth (Thresh e1 e2 e3 e4) = 1 + foldr max 0 (map depth [e1, e2, e3, e4])