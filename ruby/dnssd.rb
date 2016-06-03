require 'dnssd'

Thread.abort_on_exception = true
trap 'INT' do exit end
trap 'TERM' do exit end

#browser = DNSSD::Service.new
services = {}

DNSSD.browse! '_ssh._tcp' do |reply|
  p reply.name
  services[reply.fullname] = reply
  next if reply.flags.more_coming?

  services.sort_by do |_, service|
    [(service.flags.add? ? 0 : 1), service.fullname]
  end.each do |_, service|
    next unless service.flags.add?

    DNSSD.resolve service do |r|
      puts "#{r.name} on #{r.target}:#{r.port}"
        puts "\t#{r.text_record.inspect}" unless r.text_record.empty?
      #"break unless r.flags.more_coming?
    end
  end

  services.clear

  puts "aaa"
end

#DNSSD.browse '_ssh._tcp.' do |reply|
#j  p reply.fullname
#  p reply.name
#next if reply.flags.more_coming?
#  DNSSD::Service.new.resolve reply do |r|
#    puts "#{r.name} on #{r.target}:#{r.port}"
#      puts "\t#{r.text_record.inspect}" unless r.text_record.empty?
#    break unless r.flags.more_coming?
#  end
#end
