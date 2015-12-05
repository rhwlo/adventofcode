import Test.HUnit
import Routing (assistedDelivery, countVisitedHouses)

tests = TestList [
  TestLabel "Delivery tests" (TestList [
    TestLabel ">" (TestCase (countVisitedHouses ">" @=? 2)),
    TestLabel "^>v<" (TestCase (countVisitedHouses "^>v<" @=? 4)),
    TestLabel "^v^v^v^v^v" (TestCase (countVisitedHouses "^v^v^v^v^v" @=? 2)) ]),
  TestLabel "Delivery tests with assistance" (TestList [
    TestLabel "^v" (TestCase (assistedDelivery "^v" @=? 3)),
    TestLabel "^>v<" (TestCase (assistedDelivery "^>v<" @=? 3)),
    TestLabel "^v^v^v^v^v" (TestCase (assistedDelivery "^v^v^v^v^v" @=? 11))
  ])]

main :: IO ()
main = runTestTT tests >> return ()
