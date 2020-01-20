require 'spec_helper'
require 'matrix'
require_relative '../prime_table.rb'

describe PrimeTable do
  it 'creates a prime table class' do
    prime_table = PrimeTable.new(5)
    expect(prime_table).to be_kind_of(PrimeTable)
    expect(prime_table).to have_attributes(:size => 5)
  end

  describe '.primes' do
    it 'returns an empty array when size is zero' do
      prime_table = PrimeTable.new(0)
      expect(prime_table.primes).to eq([])
    end
    it 'returns an array containing 2 when size is one' do
      prime_table = PrimeTable.new(1)
      expect(prime_table.primes).to eq([2])
    end
    it 'returns an array containing first five prime numbers when size is 5' do
      prime_table = PrimeTable.new(5)
      expect(prime_table.primes).to eq([2, 3, 5, 7, 11])
    end
  end

  describe '.table' do
    it 'returns an empty array when size is zero' do
      prime_table = PrimeTable.new(0)
      expect(prime_table.table).to eq(Matrix.empty)
    end
    it 'returns a matrix containing 4 when size is one' do
      prime_table = PrimeTable.new(1)
      expect(prime_table.table).to eq(Matrix[[4]])
    end
    it 'returns a matrix containing a multiplication table when the size is 5' do
      prime_table = PrimeTable.new(5)
      expect(prime_table.table).to eq(Matrix[[4, 6, 10, 14, 22], [6, 9, 15, 21, 33], [10, 15, 25, 35, 55], [14, 21, 35, 49, 77], [22, 33, 55, 77, 121]])
    end
  end
end