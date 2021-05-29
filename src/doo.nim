{.experimental: "strictFuncs".}
import doopkg / [util, serde]
import colorizeEcho
import os

if not dirExists ".git":
  colorizeEcho "[red]Not a git repository."
  quit(1)

proc askTitle: string =
  stdout.write "Title (Required) > "
  result = stdin.readLine
  if result == "":
    colorizeEcho "[red]Title is required."
    return askTitle()

proc askDescription: string =
  stdout.write "Description > "
  result = stdin.readLine


proc add {.cmd.} =
  let
    title = askTitle()
    description = askDescription()
  loadTodos()
  .addTodo(newTodo(title, description, @[], false))
  .save

proc done(commit: bool) {.cmd.} =
  discard

proc rm {.cmd.} =
  discard

proc ls {.cmd.} =
  discard

when isMainModule:
  import cligen
  dispatchMulti(
    [addCmd, cmdName = "add"],
    [doneCmd, cmdName = "done"],
    [rmCmd, cmdName = "rm"],
    [lsCmd, cmdName = "ls"],
  )
