def readChunkedData(s,data)
  puts "readChunkedData begin #{data} #{data.length}"
  chunks = data.split("\r\n")
  if chunks[0] != "0"
    f = false
    for idx in 0..chunks.size-1
      next if idx % 2 == 1
      puts "idx = #{idx}"
      if chunks[idx] == "0"
        f = true
        break
      end
      if chunks[idx] != "" 
        hex = "0x" + chunks[idx]
        readSize = Integer(hex)-chunks[idx+1].length
        if readSize >0 
          chunks[idx+1] = chunks[idx+1] + s.recv(readSize+2)
          p chunks[idx+1]
        end
      end
      $body = $body + chunks[idx+1]
    end
    if !f
      readChunkedData(s, s.recv(1024))
    end
  end
  puts "readChunkedData end"
end

def isFinishBody(s,data)
  puts "isFinishBody begin"
  if $isChunked
    readChunkedData(s, data)
  else
    # Content-Length
    readSize = $contentLength - data.length
    puts "readSize = #{readSize}"
      if readSize >0
        data = data + s.recv(readSize)
      end
    $body = data
  end
  puts "isFinishBody end"
end

def analyzeHeader(header) 
  puts "analyzeHeader begin"
  headers = header.split("\r\n")
  for h in headers do
    #p h
    h.downcase!
    if h.index("content-length:") == 0 
      $contentLength = h.split(":")[1].to_i
      p $contentLength
    end
    if h.index("transfer-encoding:" ) == 0
      puts "Transfer-Encoding"
           if h.index("chunked") >0
        puts "chunked" 
        $isChunked = true
      end
    end
  end
  puts "analyzeHeader end"
end

def readHeader(s, data)
  puts "readHeader begin"
  buf = s.recv(1024)
  data = data + buf
  if buf.index("\r\n\r\n") >= 0
    parse(s,data)
  end
  if !$haveHeader
    readHeader(s, data)
  end
  puts "readHeader end"
end

def parse(s,data)
  puts "parse begin"

  $isFinishBody = false
  $isChunked = false
  $haveHeader = false
  $body = ""
   if data.index("\r\n\r\n") == nil
    puts "no header."
    readHeader(s, data)
    return $body
  else 
    header = data.split("\r\n\r\n")
    p header
    analyzeHeader(header[0])
    if header.size  == 1
      isFinishBody(s, s.recv(1024))
    else
      $haveHeader = true
      $isFinishBody = isFinishBody(s,header[1])

    end
    $body
  end
end

s = TCPSocket.open("192.168.0.201", 8080)
#s.write("POST /hhvm/test.php HTTP/1.1\r\nHost: localhost\r\nContent-Length: 3\r\nContent-Type: application/x-www-form-urlencoded\r\n\r\nA=b")
s.write("GET / HTTP/1.1\r\nHost: 192.168.0.201\r\n\r\n")
puts parse(s,s.recv(256))
puts "<----"
s.write("GET /hhvm/test.php HTTP/1.1\r\nHost: 192.168.0.201\r\n\r\n")
puts parse(s,s.recv(2))
s.close
