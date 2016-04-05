class PhoneNumber
  BAD_NUMBER = '0000000000'

  attr_reader :number, :area_code

  def initialize number
    @number, @area_code = if is_valid? number
                            clean_number = clean_number(number)
                            [clean_number, clean_number[0..2]]
                          else
                            [BAD_NUMBER, nil]
                          end
  end

  def to_s
    pretty_print @number
  end

  private
  def clean_number number
    clean_number = number.gsub(/\D/, '')
    if clean_number.length == 11 && clean_number.chars.first == '1'
      clean_number[1..10]
    else
      clean_number
    end
  end

  def pretty_print number
    clean_number = clean_number(number)
    start_index = number.length - 10
    "".tap do |pretty_number|
      for i in start_index..9
        if i == start_index
          pretty_number << "(#{number[i]}"
        elsif i == (start_index + 2)
          pretty_number << "#{number[i]}) "
        elsif i == (start_index + 5)
          pretty_number << "#{number[i]}-"
        else
          pretty_number << number[i]
        end
      end
    end
  end

  def is_valid? number
    return false if number =~ /[A-Za-z]/
    clean_number = clean_number(number)
    case clean_number.length
    when 10
      true
    when 11
      clean_number[0] == '1'
    else
      false
    end
  end
end
