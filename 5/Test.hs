import Test.HUnit
import Quality (isNaughty, isNice, newIsNaughty, newIsNice)

tests = TestList [
  TestLabel "Naughty/nice strings" (TestList [
    TestLabel "ugknbfddgicrmopn" (TestCase (assert (isNice "ugknbfddgicrmopn"))),
    TestLabel "aaa" (TestCase (assert (isNice "aaa"))),
    TestLabel "jchzalrnumimnmhp" (TestCase (assert (isNaughty "jchzalrnumimnmhp"))),
    TestLabel "haegwjzuvuyypxyu" (TestCase (assert (isNaughty "haegwjzuvuyypxyu"))),
    TestLabel "dvszwmarrgswjxmb" (TestCase (assert (isNaughty "dvszwmarrgswjxmb")))]),
  TestLabel "New naughty/nice strings" (TestList [
    TestLabel "qjhvhtzxzqqjkmpb" (TestCase (assert (newIsNice "qjhvhtzxzqqjkmpb"))),
    TestLabel "xxyxx" (TestCase (assert (newIsNice "xxyxx"))),
    TestLabel "uurcxstgmygtbstg" (TestCase (assert (newIsNaughty "uurcxstgmygtbstg"))),
    TestLabel "ieodomkazucvgmuy" (TestCase (assert (newIsNaughty "ieodomkazucvgmuy")))
  ])]

main :: IO ()
main = runTestTT tests >> return ()
