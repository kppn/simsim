class XProto
  attr_accessor :version, :value

  def self.from_bytes(byte_str, geta)
    xproto = self.new
    xproto.version = byte_str[0].unpack('C').shift
    xproto.value   = byte_str[1].unpack('C').shift + geta
    xproto
  end

  def encode
    [version, value].pack('CC')
  end
end
