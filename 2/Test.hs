import Test.HUnit
import Wrapping(areaFromDimensions, ribbonLengthFromDimensions)

tests = TestList [
  TestLabel "Area tests" (TestList [
    TestLabel "2x3x4" (TestCase (areaFromDimensions "2x3x4" @=? 58)),
    TestLabel "1x1x10" (TestCase (areaFromDimensions "1x1x10" @=? 43)) ]),
  TestLabel "Length tests" (TestList [
    TestLabel "2x3x4" (TestCase (ribbonLengthFromDimensions "2x3x4" @=? 34)),
    TestLabel "1x1x10" (TestCase (ribbonLengthFromDimensions "1x1x10" @=? 14))])]

main :: IO ()
main = runTestTT tests >> return ()
