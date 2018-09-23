# Package

version       = "0.1.0"
author        = "rcsv"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["crawler"]


# Dependencies

requires "nim >= 0.18.1"

#[
  this package requires SSL.
  nimble build -d:ssl
]#
