import PortfolioCore

expect :: Bool -> IO ()
expect True = pure ()
expect False = error "fixture mismatch"

main :: IO ()
main = do
  let signalcase_1 = Signal 63 75 21 5 7
  expect (score signalcase_1 == 153)
  expect (classify signalcase_1 == "accept")
  let signalcase_2 = Signal 71 78 8 23 4
  expect (score signalcase_2 == 124)
  expect (classify signalcase_2 == "review")
  let signalcase_3 = Signal 76 85 10 17 12
  expect (score signalcase_3 == 199)
  expect (classify signalcase_3 == "accept")
