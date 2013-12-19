class Array

# Inverting an Array to Form a Hash
  def check
      h={}
      self.each_with_index{|x,i| h[x]=i}
      h
  end
end

a = ["bat","abae","abat","sbat","bat","cat","clap","slap","bat"]
h = a.check
puts "#{h}"
h.each {|k,v| puts "#{k} => #{v}"}
