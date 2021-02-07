//
//  DispatchOnMainThread.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

func dispatchOnMainThread(_ action: @escaping () -> Void) {
    if Thread.isMainThread {
        action()
    } else {
        DispatchQueue.main.async {
            action()
        }
    }
}

func dispatchOnMainThreadAfter(_ seconds: Int, _ action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(seconds)) {
        action()
    }
}
