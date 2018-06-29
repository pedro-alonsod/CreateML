import CreateMLUI
import PlaygroundSupport
import Cocoa

let view = NSView(frame: NSRect(x: 0, y: 0, width: 200, height: 400))
let lbTest = NSButton(frame: NSRect(x: 20, y: 20, width: 50, height: 20))
lbTest.title = "Cocoa"
lbTest.addToolTip(NSRect(x: 0, y: 0, width: 20, height: 20), owner: lbTest, userData: nil)
lbTest.action = Selector("Hello")
//view.addSubview(lbTest)
PlaygroundPage.current.liveView = view
//PlaygroundPage.current.needsIndefiniteExecution = true

let builder = MLImageClassifierBuilder()
builder.showInLiveView()
