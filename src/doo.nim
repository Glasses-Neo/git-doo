{.experimental: "strictFuncs".}
import doo / [utils, serde]
import colorizeEcho
import os

if not fileExists ".git":
  colorizeEcho "[red]Not [red]a [red]git [red]repository."
  quit(1)

proc askTitle: string =
  stdout.write "Title (Required) > "
  result = stdin.readLine
  if result == "":
    colorizeEcho "[red]Title [red]is [red]required."
    return askTitle()

proc askDescription: string =
  stdout.write "Description > "
  result = stdin.readLine


proc def {.cmd.} =
  result = 0
  var
    todos = loadTodos()
  let
    title = askTitle()
    description = askDescription()

  todos.add newTodo(title, description)
  save(todos)

proc fin {.cmd.} =
  discard

proc del {.cmd.} =
  discard

when isMainModule:
  import cligen
  dispatchMulti(
    [defCmd, cmdName = "def"],
    [finCmd, cmdName = "fin"],
    [delCmd, cmdName = "del"],
  )
