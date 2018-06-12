import CreateMLUI
import PlaygroundSupport
import Cocoa

let view = NSView(frame: NSRect(x: 0, y: 0, width: 200, height: 400))

PlaygroundPage.current.liveView = view
//PlaygroundPage.current.needsIndefiniteExecution = true

let builder = MLImageClassifierBuilder()
builder.showInLiveView()
