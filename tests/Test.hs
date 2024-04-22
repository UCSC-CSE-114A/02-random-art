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
      "assoc 0"
  , mkTest
      (assoc 0 "pikachu")
      [("cormac", 85), ("owen",23), ("lindsey",44)]
      85
      "assoc 1"
  , mkTest
      (assoc 0 "cormac")
      [("cormac", 85), ("owen",23), ("lindsey",44), ("cormac",9)]
      85
      "assoc 2"
  , mkTest
      (assoc 0 "bob")
      [("cormac", 85), ("owen",23), ("lindsey",44), ("cormac",9)]
      0
      "assoc 3"
  , mkTest
      listReverseTR
      [1, 2, 3, 4]
      [4, 3, 2, 1]
      "listReverseTR 1"
  , mkTest
      listReverseTR
      ["a", "b", "c", "d"]
      ["d", "c", "b", "a"]
      "listReverseTR 2"
  , mkTest
      listReverseTR
      ([] :: [Integer])
      []
      "listReverseTR 3"
  , mkTest
      doubleEveryOtherTR
      [8,7,6,5]
      [8,14,6,10]
      "doubleEveryOtherTR 1"
  , mkTest
      doubleEveryOtherTR
      [1,2,3]
      [1,4,3]
      "doubleEveryOtherTR 2"
  , mkTest
      doubleEveryOtherTR
      []
      []
      "doubleEveryOtherTR 3"
  , mkTest
      sumListTR
      []
      0
      "sumListTR 1"
  , mkTest
      sumListTR
      [1, 2, 3, 4]
      10
      "sumListTR 2"
  , mkTest
      sumListTR
      [1, -2, 3, 5]
      7
      "sumListTR 3"
  , mkTest
      sumListTR
      [1, 3, 5, 7, 9, 11]
      36
      "sumListTR 4"
  , mkTest
      sumListTR
      [1..10000000]  -- This is intended to overflow the stack if `sumListTR` is not tail-recursive
      50000005000000
      "sumListTR 5"
  , mkTest
      exprToString
      sampleExpr0
      "sin(pi*((x+y)/2))" 
      "exprToString 0"
  , mkTest
      exprToString
      sampleExpr1
      "(x<y?x:sin(pi*x)*cos(pi*((x+y)/2)))"
      "exprToString 1"
  , mkTest
      exprToString
      sampleExpr2
      "(x<y?sin(pi*x):cos(pi*y))"
      "exprToString 2"
  , mkTest
      exprToString
      sampleExpr3
      "cos(pi*sin(pi*cos(pi*((cos(pi*x)+cos(pi*cos(pi*((y*y+cos(pi*x))/2)))*cos(pi*sin(pi*cos(pi*y))*((sin(pi*x)+x*x)/2)))/2))*y))"
      "exprToString 3"
  , mkTestIO
      (emitGray "sample.png" 150)
      sampleExpr3
      ()
      "eval 1"
  , mkTestIO
      (emitGray "sample2.png" 150)
      sampleExpr2
      ()
      "eval 2"
  , mkTestIO
      (emitRandomGray 150)
      g1
      ()
      "gray 1"
  , mkTestIO
      (emitRandomGray 150)
      g2
      ()
      "gray 2"
  , mkTestIO
      (emitRandomGray 150)
      g3
      ()
      "gray 3"
  , mkTestIO
      (emitRandomColor 150)
      c1
      ()
      "color 1"
  , mkTestIO
      (emitRandomColor 150)
      c2
      ()
      "color 2"
  , mkTestIO
      (emitRandomColor 150)
      c3
      ()
      "color 3"
  ]
  where
    mkTest :: (Show b, Eq b) => (a -> b) -> a -> b -> String -> TestTree
    mkTest f = mkTest' sc (return . f)

    mkTestIO :: (Show b, Eq b) => (a -> IO b) -> a -> b -> String -> TestTree
    mkTestIO = mkTest' sc
