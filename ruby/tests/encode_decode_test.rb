#!/usr/bin/ruby

# generated_code.rb is in the same directory as this test.
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'generated_code_pb'
require 'test/unit'

def hex2bin(s)
  s.scan(/../).map { |x| x.hex.chr }.join
end

class EncodeDecodeTest < Test::Unit::TestCase
  def test_discard_unknown
    # Test discard unknown in message.
    unknown_msg = A::B::C::TestUnknown.new(:unknown_field => 1)
    from = A::B::C::TestUnknown.encode(unknown_msg)
    m = A::B::C::TestMessage.decode(from)
    Google::Protobuf.discard_unknown(m)
    to = A::B::C::TestMessage.encode(m)
    assert_equal '', to

    # Test discard unknown for singular message field.
    unknown_msg = A::B::C::TestUnknown.new(
	    :optional_unknown =>
	    A::B::C::TestUnknown.new(:unknown_field => 1))
    from = A::B::C::TestUnknown.encode(unknown_msg)
    m = A::B::C::TestMessage.decode(from)
    Google::Protobuf.discard_unknown(m)
    to = A::B::C::TestMessage.encode(m.optional_msg)
    assert_equal '', to

    # Test discard unknown for repeated message field.
    unknown_msg = A::B::C::TestUnknown.new(
	    :repeated_unknown =>
	    [A::B::C::TestUnknown.new(:unknown_field => 1)])
    from = A::B::C::TestUnknown.encode(unknown_msg)
    m = A::B::C::TestMessage.decode(from)
    Google::Protobuf.discard_unknown(m)
    to = A::B::C::TestMessage.encode(m.repeated_msg[0])
    assert_equal '', to

    # Test discard unknown for map value message field.
    unknown_msg = A::B::C::TestUnknown.new(
	    :map_unknown =>
	    {"" => A::B::C::TestUnknown.new(:unknown_field => 1)})
    from = A::B::C::TestUnknown.encode(unknown_msg)
    m = A::B::C::TestMessage.decode(from)
    Google::Protobuf.discard_unknown(m)
    to = A::B::C::TestMessage.encode(m.map_string_msg[''])
    assert_equal '', to

    # Test discard unknown for oneof message field.
    unknown_msg = A::B::C::TestUnknown.new(
	    :oneof_unknown =>
	    A::B::C::TestUnknown.new(:unknown_field => 1))
    from = A::B::C::TestUnknown.encode(unknown_msg)
    m = A::B::C::TestMessage.decode(from)
    Google::Protobuf.discard_unknown(m)
    to = A::B::C::TestMessage.encode(m.oneof_msg)
    assert_equal '', to
  end
end
