require 'rspec'
require_relative '../lib/roman_numerals'

describe 'Roman Numerals Encoder' do

  before(:each) do
    @encoder = RomanNumerals.new
  end

  it 'encodes zero to an empty string' do
    expect(@encoder.encode(0)).to eq('')
  end

  it 'encodes numbers to single numerals' do
    expect(@encoder.encode(1)).to eq('I')
    expect(@encoder.encode(4)).to eq('IV')
    expect(@encoder.encode(5)).to eq('V')
    expect(@encoder.encode(9)).to eq('IX')
    expect(@encoder.encode(10)).to eq('X')
    expect(@encoder.encode(40)).to eq('XL')
    expect(@encoder.encode(50)).to eq('L')
    expect(@encoder.encode(90)).to eq('XC')
    expect(@encoder.encode(100)).to eq('C')
    expect(@encoder.encode(500)).to eq('D')
    expect(@encoder.encode(1000)).to eq('M')
  end

  it 'encodes numbers with multiple numerals' do
    expect(@encoder.encode(2)).to eq('II')
    expect(@encoder.encode(30)).to eq('XXX')
    expect(@encoder.encode(26)).to eq('XXVI')
    expect(@encoder.encode(944)).to eq('CMXLIV')
    expect(@encoder.encode(1349)).to eq('MCCCXLIX')
  end

end
