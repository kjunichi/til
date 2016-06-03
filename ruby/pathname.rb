require 'pathname'

juliaPath = `which julia`
puts "juliaPath = #{juliaPath}"

  if juliaPath != "" then
    juliaConfig=Pathname(juliaPath).dirname.dirname / "share/julia/julia-config.jl" 
  else
    juliaCmd = `ls /Applications/|grep Julia|sort -r`.split("\n")[0]
    juliaPath=  "/Applications/#{juliaCmd}/Contents/Resources/julia/bin"
      ENV['PATH']=ENV['PATH']+":"+juliaPath
    puts `which julia`
    juliaConfig=Pathname(juliaPath).dirname / "share/julia/julia-config.jl"
  end

puts `#{juliaConfig} --cflags`

