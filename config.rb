log 'Simsim'

require_relative 'protocol/raw.rb'

peer '127.0.0.1:50000', '127.0.0.1:50001', Raw

