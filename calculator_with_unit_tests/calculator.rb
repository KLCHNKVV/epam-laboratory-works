class Calculator

  attr_accessor :first_value, :second_value

  def self.divide first_value, second_value
    (first_value.to_f / second_value.to_f).round(3)
  end

  def self.addition first_value, second_value
    first_value + second_value
  end

  def self.multiplication first_value, second_value
    first_value * second_value
  end

  def self.minus first_value, second_value
    first_value - second_value
  end

  def self.sqrt first_value
    Math.sqrt(first_value).to_f.round(3)
  end

end