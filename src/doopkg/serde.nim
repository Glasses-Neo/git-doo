{.experimental: "strictFuncs".}
import os, streams
import yaml/serialization

let yamlPath = getCurrentDir()/".doo.yaml"

proc newYamlStream(mode: FileMode): FileStream = newFileStream(yamlPath, mode)

type
  Todo* = ref object
    title: string
    description: string
    tags: seq[string]
    isDone: bool

func newTodo*(title, description: string; tags: seq[string] = @[];
    isDone = false): Todo =
  result = Todo(
    title: title,
    description: description,
    tags: tags,
    isDone: isDone,
  )

proc addTodo*(todoList: seq[Todo], todos: varargs[Todo]): seq[Todo] =
  result = todoList
  for todo in todos:
    result.add todo

proc save*(todoList: seq[Todo]) =
  var f = newYamlStream(fmWrite)
  defer: close f
  dump(todoList, f)

proc loadTodos*: seq[Todo] =
  if not getFileSize(yamlPath) == 0 and fileExists(yamlPath):
    var f = newYamlStream(fmRead)
    defer: close f
    load(f, result)
