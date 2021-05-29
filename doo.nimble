# Package

version       = "0.1.0"
author        = "Glasses-Neo"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["doo"]
binDir        = "bin"


# Dependencies

requires "nim >= 1.4.8"
requires "cligen"
requires "colorizeEcho"
requires "yaml#head"
requires "cascade"

task renamebuild, "":
  selfExec "c --hints:off -d:musl --opt:size -o:bin/git-doo src/doo.nim"
