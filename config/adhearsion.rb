# encoding: utf-8

Adhearsion.config do |config|

  # Centralized way to specify any Adhearsion platform or plugin configuration
  # - Execute rake config:show to view the active configuration values
  #
  # To update a plugin configuration you can write either:
  #
  #    * Option 1
  #        Adhearsion.config.<plugin-name> do |config|
  #          config.<key> = <value>
  #        end
  #
  #    * Option 2
  #        Adhearsion.config do |config|
  #          config.<plugin-name>.<key> = <value>
  #        end

  config.development do |dev|
    dev.platform.logging.level = :error
  end

  ##
  # Use with Rayo (eg Voxeo PRISM)
  #
  # config.punchblock.username = "" # Your XMPP JID for use with Rayo
  # config.punchblock.password = "" # Your XMPP password

  ##
  # Use with Asterisk
  #
  config.punchblock.platform = :asterisk # Use Asterisk
  config.punchblock.username = "manager" # Your AMI username
  config.punchblock.password = "password" # Your AMI password
  config.punchblock.host = "asterisk.local-dev.mojolingo.com" # Your AMI host

  ##
  # Use with FreeSWITCH
  #
  # config.punchblock.platform = :freeswitch # Use FreeSWITCH
  # config.punchblock.password = "ClueCon" # Your Inbound EventSocket password
  # config.punchblock.host = "192.168.10.10" # Your IES host
end

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  #ami do |event|
    #puts "#{event.target_call_id} > #{event.name} - Channel #{event.attributes_hash[:channel]} - Channel1: #{event.attributes_hash[:channel1]} - Channel2: #{event.attributes_hash[:channel2]}\n"
    #puts "#{event.inspect}\n\n"
  #end
  #
  # eg Handling PeerStatus AMI events
   #ami :name => 'Hangup' do |event|
     #logger.info event.inspect
   #end
  #
end

Adhearsion.router do

  #
  # Specify your call routes, directing calls with particular attributes to a controller
  #

  route 'default', SandboxController
end