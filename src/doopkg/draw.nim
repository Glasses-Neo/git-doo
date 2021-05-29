import illwill
import cascade

proc exitProc {.noconv.} =
  illwillDeinit()
  showCursor()
  quit(0)

illwillInit(fullScreen=true)
setControlCHook exitProc
hideCursor()

var tb = cascade newTerminalBuffer(terminalWidth(), terminalHeight()):
  setForegroundColor(fgBlack, true)
  drawRect(0, 0, 40, 5)
  drawHorizLine(2, 38, 3, doubleStyle=true)
