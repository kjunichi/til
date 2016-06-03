require 'dnssd'

Thread.abort_on_exception = true
trap 'INT' do exit end
trap 'TERM' do exit end

DNSSD.browse! '_ssh._tcp.' do |reply|
  p reply.fullname
  p reply.name
end
