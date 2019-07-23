class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    new_str = ""
    new_str += (self.length*90-79/7).to_s
    alphabet = ("a".."z").to_a
    self.each do |el|
      if el.is_a?(String)
        new_str += ((el.hash)/11 + 52).to_s
      elsif el.is_a?(Integer)
        new_str += (el*107-43/2).to_s
      elsif el.class == TrueClass || el.class == FalseClass
        new_str += (500-22/4).to_s if el == true
        new_str += (777-52/4).to_s if el == false
      end 
    end 
    new_str.to_i.hash
  end
end

class String
  def hash
    new_str = ""
    new_str += (self.length*90-79/7).to_s
    alphabet = ("a".."z").to_a
    self.each_char do |char|
      if char.to_i == 0 && char != "0"
        new_str += (alphabet.index(char.downcase)-11+52).to_s
      else
        new_str += (char.to_i *107-43/2).to_s
      end
    end
    new_str.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_str = 0
    keys = self.keys.hash
    values = self.values.hash
    new_str = keys + values 
    new_str.hash
  end
end
