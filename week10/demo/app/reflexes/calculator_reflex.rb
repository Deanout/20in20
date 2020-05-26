# frozen_string_literal: true

class CalculatorReflex < StimulusReflex::Reflex
  def Calculate
    @word_count = element[:value].split(/\W+/).count
    @words = element[:value]
    @reversed = element[:value].reverse
  end
end
