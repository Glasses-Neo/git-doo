# Package

version       = "0.1.0"
author        = "Glasses-Neo"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["doo"]
binDir        = "bin"


# Dependencies

requires "nim >= 1.4.6"
requires "cligen"
requires "colorizeEcho"
requires "yaml#head"

task renamebuild, "":
  exec "nimble build"
  withDir "./bin":
    exec "mv doo git-doo"
