module MonoidsInPractice where

import Text.Printf

data OrderLine = OrderLine {
  productCode :: String,
  quantity :: Int,
  total :: Float
}


instance Show OrderLine where
  show orderLine =
    printf "%-10s %5i %6g" olCode olQuantity olTotal
    where
      OrderLine olCode olQuantity olTotal  = orderLine


sampleLines :: [OrderLine]
sampleLines =
  [ OrderLine { productCode = "AAA", quantity = 2, total = 2.99 },
    OrderLine { productCode = "BBB", quantity = 1, total = 1.99 },
    OrderLine { productCode = "CCC", quantity = 3, total = 3.99 }
  ]


moreSampleLines :: [OrderLine]
moreSampleLines =
  [ OrderLine { productCode = "DDD", quantity = 4, total = 4.99 },
    OrderLine { productCode = "BBB", quantity = 1, total = 1.99 },
    OrderLine { productCode = "EEE", quantity = 2, total = 2.00 }
  ]


addLine :: OrderLine -> OrderLine -> OrderLine
addLine line1 line2 =
  OrderLine {
    productCode = "TOTAL",
    quantity = quantity line1 + quantity line2,
    total = total line1 + total line2
  }


emptyLine :: OrderLine
emptyLine =
  OrderLine {
    productCode = "",
    quantity = 0,
    total = 0
  }


totalLine :: OrderLine
totalLine = foldl addLine emptyLine sampleLines


main = do
  mapM_ print sampleLines
  putStrLn "-----------------------"
  print totalLine
  putStrLn "-----------------------"
  mapM_ print moreSampleLines
  putStrLn "-----------------------"
  print totalLine
