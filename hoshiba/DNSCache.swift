import Foundation

class DNSCache {
    static let shared = DNSCache()
    
    // domain to IP addresses
    private var cache: [String: [String]] = [:]

    private init() {}

    func resolve(domain: String) -> [String]? {
        return cache[domain]
    }

    func cache(domain: String, ips: [String]) {
        cache[domain] = ips
    }
}
