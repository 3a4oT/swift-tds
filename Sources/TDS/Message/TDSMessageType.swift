import NIO

public protocol TDSPacketType {
    static var headerType: TDSPacket.HeaderType { get }
    static func parse(from buffer: inout ByteBuffer) throws -> Self
    func serialize(into buffer: inout ByteBuffer) throws
}

extension TDSPacketType {
    public static func parse(from buffer: inout ByteBuffer) throws -> Self {
        fatalError("\(Self.self) does not support parsing.")
    }
    
    public func serialize(into buffer: inout ByteBuffer) throws {
        fatalError("\(Self.self) does not support serializing.")
    }
}
