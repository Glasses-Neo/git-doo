import macros

macro cmd*(theProc: untyped): untyped =
  result = theProc
  result.name = newIdentNode(theProc.name.strVal&"Cmd")
  result[3][0] = newIdentNode("int")
