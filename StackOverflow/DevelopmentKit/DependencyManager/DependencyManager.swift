//
//  DependencyManager.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

public func resolve<Protocol>(_ aProtocol: Protocol.Type) -> Protocol {
    return StackDependencyManager.shared.resolve(aProtocol)
}

@objc final public class StackDependencyManager: NSObject {
    
    private var registrations = [String: () -> Any]()
    @objc(sharedInstance)
    static public var shared = StackDependencyManager()

    public func register<Implementation>(_ implementation: @escaping () -> Implementation, for aProtocol: Implementation.Type) {
        registrations[String(describing: aProtocol)] = implementation
    }

    func resolve<Protocol>(_ aProtocol: Protocol.Type) -> Protocol {
        StackDependencyManager.registerDefaults()
        let protocolDescription = String(describing: aProtocol)
        guard let aProtocol = registrations[protocolDescription]?() as? Protocol else {
            fatalError("Failed to find registration for \(protocolDescription)")
        }
        return aProtocol
    }
    
    static func reset() {
        StackDependencyManager.shared.registrations.removeAll()
        registerDefaults()
    }
    
    public static func registerDefaults() {
        registerNetworkControllers()
        registerFlowCoordinators()
    }
    
    static func registerNetworkControllers() {
        StackDependencyManager.shared.register( { SearchNetworkController() }, for: SearchNetworkProtocol.self)
        StackDependencyManager.shared.register( { SearchNetworkController() }, for: SearchNetworkProtocol.self)
    }
    
    @objc
    static func registerFlowCoordinators() {
        StackDependencyManager.shared.register( { StackCoordinator.shared }, for: StackCoordinatorProtocol.self)
    }
}
