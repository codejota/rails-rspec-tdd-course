# frozen_string_literal: true

# This class is responsible for performing basic arithmetic operations
#
class Calculator
  def add(a = 0, b = 0)
    return 0 unless valid_numbers?(a, b)

    a + b
  end

  def subtract(a = 0, b = 0)
    return 0 unless valid_numbers?(a, b)

    a - b
  end

  def multiply(a = 0, b = 0)
    return 0 unless valid_numbers?(a, b)

    a * b
  end

  def divide(a = 0, b = 1)
    return 0 unless valid_numbers?(a, b)
    return 'Division by zero error' if b.zero?

    a / b
  end

  private

  def valid_numbers?(a, b)
    a.is_a?(Numeric) && b.is_a?(Numeric)
  end
end
