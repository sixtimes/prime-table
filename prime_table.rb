require 'matrix'

class PrimeTable
  attr_accessor :size

  def initialize(size)
    @size = size
  end

  def primes
    prime_arr = []
    prime_index = 2 # first prime number
    while prime_arr.size < @size do# O(n * ln(n)), according to the prime number theorem
      catch :divisible do
        if prime_arr.size === 0
          prime_arr.push prime_index
        else
          prime_arr.each do |num| # O(ln(n)), according to the prime number theorem
            throw :divisible if prime_index % num === 0
          end
          prime_arr.push(prime_index)
        end
      end
      prime_index += 1
    end
    prime_arr
  end

  def table
    col = Matrix.column_vector(primes)
    row = Matrix.row_vector(primes)
    col * row
  end
end

prime_table = PrimeTable.new(10)
prime_table.table.to_a.each do |row|
  puts row.join("\t")
end