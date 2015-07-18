module EnhancedNumericInput
  extend ActiveSupport::Concern

  included do
    before_validation :clean_up_numeric_input
  end

  module ClassMethods
    def numeric_columns_hash
      columns_hash.select do |name, definition|
        [:integer, :float, :decimal].include?(definition.type)
      end
    end
  end

  def clean_up_numeric_input
    self.class.numeric_columns_hash.each do |attr, definition|
      original_value = send("#{attr}_before_type_cast")
      next if original_value.blank?
      send("#{attr}=", clean_up_value(original_value))
    end
    true
  end

  def clean_up_value(value)
    value.to_s.
      gsub(',','').
      gsub(/\A\./,'0.'). # add missing integer part
      gsub(/\.\Z/,'.0'). # add missing fractional part
      gsub(/(?:(\..*[^0])0+|\.0+)\Z/, '\1') # remove trailing zeroes from the end of decimal
  end

  def non_zero_fractional_part?(value)
    BigDecimal.new(value).frac > 0
  end
end

ActiveRecord::Base.send :include, EnhancedNumericInput
