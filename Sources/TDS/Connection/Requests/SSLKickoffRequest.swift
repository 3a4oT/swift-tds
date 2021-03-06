import Logging
import NIO
extension TDSConnection {
    public func sslKickoff() -> EventLoopFuture<Void> {
        let auth = SSLKickoffRequest()
        return self.send(auth)
    }
}

// MARK: Private

private final class SSLKickoffRequest: TDSRequest {
    init() {}
    
    func log(to logger: Logger) {
        logger.debug("Kicking off Prelogin SSL Handshake.")
    }
    
    func respond(to message: TDSMessage, allocator: ByteBufferAllocator) throws -> TDSMessage? {
        return nil
    }
    
    func start(allocator: ByteBufferAllocator) throws -> TDSMessage {
        let message = try TDSMessage(packetType: TDSMessages.SSLKickoff(), allocator: allocator)
        return message
    }
}
