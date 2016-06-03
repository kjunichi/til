require 'dnssd'


DNSSD.browse '_ssh._tcp.' do |b|
  p b.name 
  DNSSD.resolve b.name, b.type, b.domain do |r|
    puts "#{b.name} of #{b.type} in #{b.domain} => #{r.target}:#{r.port} on #{b.interface} txt #{r.text_record.inspect}"
  end
end
sleep
