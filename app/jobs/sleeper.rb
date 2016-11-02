module Sleeper
    @queue = :sleep
    
     def self.perform
         puts 'i like to sleep'
         sleep 8
     end
end