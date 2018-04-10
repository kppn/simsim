
# transit state by timer, each initial - main 
state :initial do
  in_action {
    @logger.info 'in initial'
    start_timer :to_main, 3
  }

  expire(:to_main) {
    transit :main
  }

  out_action {
    @logger.info 'out initial'
  }
end

state :main do
  in_action {
    @logger.info 'in main aaa'
    start_timer :to_initial, 2
  }

  expire(:to_initial) {
    transit :initial
  }

  out_action {
    @logger.info 'out main'
  }
end

