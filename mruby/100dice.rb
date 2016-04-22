outside = 0
num = Array.new(100, 0)

while true
  base = rand(6)+1
  outside += 1

  done = true
  11.times do |inside|
    eye = rand(6)+1
    unless base == eye
      #print "#{outside}回目の挑戦は#{inside}回目の試行で失敗しました。"
      num[inside] += 1
      done = false
    end
  end
  if(done) then
    puts "dekita!! #{base}, #{outside}"
    break
  end
  
end
