import Test.HUnit
import Routing (deliverWithWorkers)

tests = TestList [
  TestLabel "Delivery tests" (TestList [
    TestLabel ">" (TestCase (deliverWithWorkers 1 ">" @=? 2)),
    TestLabel "^>v<" (TestCase (deliverWithWorkers 1 "^>v<" @=? 4)),
    TestLabel "^v^v^v^v^v" (TestCase (deliverWithWorkers 1 "^v^v^v^v^v" @=? 2)) ]),
  TestLabel "Delivery tests with assistance" (TestList [
    TestLabel "^v" (TestCase (deliverWithWorkers 2 "^v" @=? 3)),
    TestLabel "^>v<" (TestCase (deliverWithWorkers 2 "^>v<" @=? 3)),
    TestLabel "^v^v^v^v^v" (TestCase (deliverWithWorkers 2 "^v^v^v^v^v" @=? 11))
  ])]

main :: IO ()
main = runTestTT tests >> return ()
