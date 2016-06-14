# Establish connectoin
@conn = PG::Connection.new(port: 5432, dbname: "junichi")
#
# # Send SQL
data = `cat $HOME/work/mruby/mruby-webcam/mruby-webcam/examples/SunJun122154032016_smile.jpg`
File.open("src.jpg","wb") {
  |f| f.write data
}
#@conn.exec("INSERT INTO image_test(data) VALUES($1::bytea)", [{:value => data, :format => 1}])

def hex2bin(hhh)
  hhh.slice!(0,2)
  [hhh].pack "H*"
  #hhh.scan(/../).map{ |b| b.to_i(16) }.pack('C*')
  #hhh.chars.each_slice(2).map { |x| x.join.to_i(16).chr }.join
end

@conn.exec( "SELECT data::bytea FROM image_test LIMIT 1") do |res|
  img= res['data']

  File.open("#{Time.now.to_s.gsub!(' ','').gsub!(':','')}.jpg","wb") {
    |f| f.write hex2bin(img)
  }
end
