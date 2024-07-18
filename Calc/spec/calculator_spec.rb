# frozen_string_literal: true

require 'calculator'

describe Calculator do
  let(:calculator) { Calculator.new }

  context 'add method' do
    it 'adds two numbers correctly' do # setup
      result = calculator.add(2, 3) # exercise
      expect(result).to eq(5) # verify
    end

    it 'adds a negative and a positive number' do
      result = calculator.add(-2, 3)
      expect(result).to eq(1)
    end

    it 'returns zero without arguments' do
      result = calculator.add
      expect(result).to eq(0)
    end

    it 'does not allow characters' do
      result = calculator.add('x', 'y')
      expect(result).to eq(0)
    end
  end

  context 'subtract method' do
    it 'subtracts two numbers correctly' do
      result = calculator.subtract(3, 2)
      expect(result).to eq(1)
    end

    it 'subtracts a positive number from a negative number' do
      result = calculator.subtract(-2, 3)
      expect(result).to eq(-5)
    end

    it 'returns zero without arguments' do
      result = calculator.subtract
      expect(result).to eq(0)
    end

    it 'does not allow characters' do
      result = calculator.subtract('x', 'y')
      expect(result).to eq(0)
    end
  end

  context 'multiply method' do
    it 'multiplies two numbers correctly' do
      result = calculator.multiply(2, 3)
      expect(result).to eq(6)
    end

    it 'multiplies a negative and a positive number' do
      result = calculator.multiply(-2, 3)
      expect(result).to eq(-6)
    end

    it 'returns zero without arguments' do
      result = calculator.multiply
      expect(result).to eq(0)
    end

    it 'does not allow characters' do
      result = calculator.multiply('x', 'y')
      expect(result).to eq(0)
    end
  end

  context 'divide method' do
    it 'divides two numbers correctly' do
      result = calculator.divide(6, 3)
      expect(result).to eq(2)
    end

    it 'divides a negative and a positive number' do
      result = calculator.divide(-6, 3)
      expect(result).to eq(-2)
    end

    it 'returns zero without arguments' do
      result = calculator.divide
      expect(result).to eq(0)
    end

    it 'does not allow characters' do
      result = calculator.divide('x', 'y')
      expect(result).to eq(0)
    end

    it 'raises error when dividing by zero' do
      result = calculator.divide(3, 0)
      expect(result).to eq('Division by zero error')
    end
  end
end
