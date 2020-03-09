//
//  AppDelegate.swift
//  focusBug
//
//  Created by Darrell Root on 3/9/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windows: [Int:NSWindow] = [:]
    var windowCount = 0

    @IBAction func newFocusWindow(_ sender: NSMenuItem) {
        newWindow()
    }
    func newWindow() {
        windowCount = windowCount + 1
        let contentView = ContentView(windowCount: windowCount)
        let window = NSWindow(
            contentRect: NSRect(x: 100, y: 100, width: 1000, height: 1000),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        windows[windowCount] = window
        window.title = "Focus Window \(self.windowCount)"
        window.tabbingMode = .disallowed
        window.center()
        //window.setFrameAutosaveName("Window \(self.windowCount)")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)

    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        newWindow()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

