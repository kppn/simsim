
state :initial do

  in_action {
    transit :state1
  }
end

state :state1 do
  receive(->{ @sig.version == 0x61 }) {
    transit :state2
  }
  receive(->{ @sig.version == 0x62 }) {
    send 'hoge'
  }
  receive(->{ @sig.version == 0x62 }, :sub) {
    send :sub, 'hoge'
  }
  receive(->{ true }) {
    @logger.info 'unknown'
  }
end

state :state2 do

  receive(->{ @sig.version == 0x62 }) {
    transit :state1
  }
end


define do
  @decode_params = [2]
end
