//
//  Logger.swift
//  WLEmptyState
//
//  Created by Alexander Camacho on 2/6/19.
//

import Foundation

final class Logger {
    
    /// Enum which maps an appropiate symbol which added as prefix for each log message
    ///
    /// - trace: Log type trace
    /// - info: Log type info
    /// - warning: Log type warning
    /// - error: Log type error
    private enum LogEvent: String {
        case trace = "🔷"
        case info = "✅"
        case warning = "⚠️"
        case error = "🔥"
    }
    
    private init() {}
    
    // MARK: - Loging methods
    
    /// Wrapping Swift.debugPrint() within DEBUG flag
    ///
    /// - Parameters:
    ///   - message: Object or message to be logged
    ///   - obj: Object to be logged
    ///   - file: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - function: Name of the function from where the logging is done
    ///
    private static func debugPrint<T>(_ message: T, level: LogEvent, obj: Any? = nil, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
        // Only allowing in DEBUG mode
        #if DEBUG
        let date = Date()
        Swift.debugPrint("\(date) \(level.rawValue) \(message)")
        
        if level == .error {
            Swift.debugPrint("\(date)    [\(shortenFile(file)), line: \(line) function: \(function)]")
        }
        
        if let obj = obj {
            Swift.debugPrint("\(date)    -> \(obj)")
        }
        #endif
        
    }
    
    /// Extract the shorten file name from the file path
    ///
    /// - Parameter filePath: Full file path in bundle
    /// - Returns: Shorten File Name
    private static func shortenFile(_ file: String) -> String {
        let components = file.components(separatedBy: "/")
        let originalCount = components.count
        let newCount = min(3, components.count)
        let end = originalCount
        let begin = end - newCount
        let lastComponents = components[begin..<end]
        let result = lastComponents.joined(separator: "/")
        return result
    }
    
    /// Logs trace verbosely on console with prefix [🔷]
    ///
    /// - Parameters:
    ///   - message: Object or message to be logged
    ///   - obj: Object to be logged
    ///   - file: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - function: Name of the function from where the logging is done
    static func logTrace<T>(_ message: T, obj: Any? = nil, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
        debugPrint(message, level: .trace, obj: obj, file, line, function)
    }
    
    /// Logs info verbosely on console with prefix [✅]
    ///
    /// - Parameters:
    ///   - message: Object or message to be logged
    ///   - obj: Object to be logged
    ///   - file: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - function: Name of the function from where the logging is done
    static func logInfo<T>(_ message: T, obj: Any? = nil, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
        debugPrint(message, level: .info, obj: obj, file, line, function)
    }
    
    /// Logs warnings verbosely on console with prefix [⚠️]
    ///
    /// - Parameters:
    ///   - message: Object or message to be logged
    ///   - obj: Object to be logged
    ///   - file: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - function: Name of the function from where the logging is done
    static func logWarning<T>(_ message: T, obj: Any? = nil, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
        debugPrint(message, level: .warning, obj: obj, file, line, function)
    }
    
    /// Logs errors verbosely on console with prefix [🔥]
    ///
    /// - Parameters:
    ///   - message: Object or message to be logged
    ///   - obj: Object to be logged
    ///   - file: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - function: Name of the function from where the logging is done
    static func logError<T>(_ message: T, obj: Any? = nil, _ file: String = #file, _ line: Int = #line, _ function: String = #function) {
        debugPrint(message, level: .error, obj: obj, file, line, function)
    }
}

