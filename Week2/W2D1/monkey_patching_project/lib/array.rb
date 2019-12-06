# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
      return nil if self.length == 0
      self.max - self.min
    end
    
    #[].empty?
    def average
      return nil if self.length == 0
      self.sum / self.length.to_f
    end
  
    def median
      return nil if self.empty?
  
      sorted = self.sort
  
      if sorted.length.odd?
          sorted[self.length / 2]
      else
          (sorted[self.length / 2] + sorted[(self.length/2) - 1]) / 2.0
      end
    end
    
    def counts
      hash = Hash.new(0)
  
      for ele in self
          hash[ele] += 1
      end
      hash
    end
  
    def my_count(value)
      
      count = 0
  
      for ele in self
          if value == ele
          count += 1
          end
      end
      count
    end
  
    def my_index(value)
  
      (0..self.length - 1).each do |i|
           if value == self[i]
              return i
           end
      end
  
      nil
    end
      
    #if the hash[ele] == 0, result << ele
    def my_uniq
      result = []
      hash = Hash.new(0)
      self.each do |ele|
          hash[ele] += 1
      end
      hash.each_key do |k|
          result << k
      end
      result
    end
  

    def my_transpose
      arr = Array.new{Array.new}
      self.each_index do |idx|  #array_index
          self.each_index do |idx2|
              value = self[idx][idx2]
              arr[idx2][idx] = value
          end
      end
      arr
    end
  
  end
  
  
  
  #bundle exec rspec spec/array_spec.rb:5