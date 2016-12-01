require 'time_for_change'

describe '#calculate_coins method' do

  it 'returns the number of coins returned' do
    expect(calculate_coins 10).to eq 1
    expect(calculate_coins 20).to eq 1
    expect(calculate_coins 100).to eq 1
    expect(calculate_coins 120).to eq 2
    expect(calculate_coins 975).to eq 14
    expect(calculate_coins 4).to eq 2
  end
end

describe '#convert_to_pence' do
  it 'converts floats to pence' do
    expect(convert_to_pence 0.30).to eq 30
    expect(convert_to_pence 0.3).to eq 30
    expect(convert_to_pence 3).to eq 300
  end

describe '#change_reporter' do
  it 'works for whole numbers' do
    answer = convert_to_pence 30
    expect(calculate_coins answer).to eq 3
  end

  it 'works for floats' do
    answer = convert_to_pence 30.2
    expect(calculate_coins answer).to eq 31
  end
end

end
