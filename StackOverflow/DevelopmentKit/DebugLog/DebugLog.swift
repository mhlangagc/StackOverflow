//
//  DebugLog.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

func debugLog(_ message: Any...) {
    #if DEBUG
        print(message)
    #endif
}

func debugLog(_ className: String, message: String) {
    #if DEBUG
    print(className + " | " + message)
    #endif
}
