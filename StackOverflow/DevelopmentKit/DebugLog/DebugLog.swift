//
//  DebugLog.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

/**
 Used for logging messages while in debug mode
 */
func debugLog(_ message: Any...) {
    #if DEBUG
        print(message)
    #endif
}

/**
Used for logging messages and the originating class while in debug mode
*/
func debugLog(_ className: String, message: String) {
    #if DEBUG
    print(className + " | " + message)
    #endif
}
