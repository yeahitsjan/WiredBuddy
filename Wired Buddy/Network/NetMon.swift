// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import Foundation
import Network
import OSLog

class WBNetworkMonitor: ObservableObject {
    let networkMonitorInstance = NWPathMonitor()
    @Published var isWiredConnection: Bool = false
    @Published var isPreferred: Bool = false
    @Published var ipAddr: String = ""
    @Published var interfaceName: String?

    private let logger: Logger = Logger(subsystem: "de.jkowalewicz.WiredBuddy", category: "WiredBuddy_NWPathMonitor")

    init() {
        start()
    }

    private func start() {
        networkMonitorInstance.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isWiredConnection = self?.isConnAvailable(in: path) ?? false
                self?.isPreferred = self?.isConnPreferred(in: path) ?? false
                self?.ipAddr = self?.getIpAddr() ?? String(localized: "not_available")
            }
        }
        let q = DispatchQueue(label: "WiredBuddy_NWPathMonitor")
        networkMonitorInstance.start(queue: q)
    }

    private func isConnAvailable(in path: NWPath) -> Bool {
        if path.status == .satisfied {
            // Network is available, but is it wired?
            if path.usesInterfaceType(.wiredEthernet) {
                logger.debug("path=satisfied,conntype=wired")
                return true
            } else {
                logger.debug("path=satisfied,conntype=other")
                return false
            }
        } else {
            // Network status unsatisfied
            logger.error("path=unsatisfied,conntype=unknown")
            return false
        }
    }

    // Checks if our connection is the preferred interface.
    private func isConnPreferred(in path: NWPath) -> Bool {
        if path.status == .satisfied {
            // Network is available, is it wired?
            if path.usesInterfaceType(.wiredEthernet) {
                // Are we a preferred interface?
                let first = path.availableInterfaces.first
                if isInterfaceWired(path: path, interfaceName: first?.name ?? "") {
                    interfaceName = first!.name
                    logger.debug("Interface name for active ethernet session: \(self.interfaceName!)")
                    return true
                } else {
                    interfaceName = nil
                    return false
                }
            } else {
                interfaceName = nil
                return false
            }
        } else {
            interfaceName = nil
            return false
        }
    }

    // Checks if a specific interface is wired or not
    private func isInterfaceWired(path: NWPath, interfaceName: String) -> Bool {
        if let interface = path.availableInterfaces.first(where: { $0.name == interfaceName }) {
            if interface.type == .wifi {
                logger.error("\(interfaceName) is wifi")
                return false
            } else if interface.type == .wiredEthernet {
                logger.debug("\(interfaceName) is ethernet / wired")
                return true
            }
        }
        logger.debug("\(interfaceName) is unknown")
        return false
    }

    // Returns the current used IP address
    public func getIpAddr() -> String? {
        var addr: String?

        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else {
            return nil
        }
        guard let firstAddr = ifaddr else {
            return nil
        }

        for iface_ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let iface = iface_ptr.pointee
            let family = iface.ifa_addr.pointee.sa_family
            if family == UInt8(AF_INET)/* || family == UInt8(AF_INET6)*/ {
                let name = String(cString: iface.ifa_name)
                if interfaceName != nil {
                    if name == interfaceName {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(iface.ifa_addr, socklen_t((iface.ifa_addr.pointee.sa_len)), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        addr = String(cString: hostname)
                        freeifaddrs(ifaddr)
                        return addr
                    }
                }
            }
        }
        freeifaddrs(ifaddr)

        return addr
    }
}
