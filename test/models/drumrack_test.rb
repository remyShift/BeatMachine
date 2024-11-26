require "test_helper"

class DrumrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # we test that we can't associate more than 5 drumracks
  test "should not save drumrack with more than 5 drumracks_samples" do
    drumrack = Drumrack.new(name: "Drumrack 1")
    drumrack.drumrack_samples << 6.times.map { DrumrackSample.new }

    assert_includes drumrack.errors.full_messages, "Drumrack samples is too long (maximum is 5 samples)"
  end

  # we test that we can't associate more than one sample per sample's category to a drumrack
  test "should not save drumrack with more than one sample per category" do
    drumrack = Drumrack.new(name: "Drumrack 1")
    sample = Sample.new(category: "kick")
    drumrack.samples << sample
    drumrack.samples << sample

    assert_includes drumrack.errors.full_messages, "Samples has already been taken"
  end
end
