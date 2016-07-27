class Person 
  def method_missing(meth_name, *word)
    p "#{meth_name} are called."
    #super
  end
end

my = Person.new
my.name "Charlie"
my.old_name "Henry"
my.size
