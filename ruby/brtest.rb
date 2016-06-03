require 'dnssd'

Thread.abort_on_exception = true
trap 'INT' do exit end
trap 'TERM' do exit end

services = {}

DNSSD.browse! '_ssh._tcp' do |reply|
  puts reply.name
  services[reply.fullname] = reply
  next if reply.flags.more_coming?

  services.sort_by do |_, service|
    [(service.flags.add? ? 0 : 1), service.fullname]
  end.each do |_, service|
    add = service.flags.add? ? 'Add' : 'Remove'
    puts "#{add} #{service.name} on #{service.domain}"
    next unless service.flags.add?

    DNSSD.resolve service do |r|
      puts "#{r.name} on #{r.target}:#{r.port}"
        puts "\t#{r.text_record.inspect}" unless r.text_record.empty?
      #break unless r.flags.more_coming?
     # puts r.flags.more_coming unless r.flags.more_coming?
    end
  end

  services.clear

  puts
  #ZZexit
end
