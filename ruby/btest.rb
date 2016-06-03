require 'dnssd'

Thread.abort_on_exception = true
trap 'INT' do exit end
trap 'TERM' do exit end

services = {}

DNSSD.browse! '_ssh._tcp' do |reply|
  services[reply.fullname] = reply
  next if reply.flags.more_coming?

  services.sort_by do |_, service|
    [(service.flags.add? ? 0 : 1), service.fullname]
  end.each do |_, service|
    add = service.flags.add? ? 'Add' : 'Remove'
    puts "#{add} #{service.name} on #{service.domain}"
    next unless service.flags.add?
  end

  services.clear

  puts
end
