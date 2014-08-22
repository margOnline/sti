require 'test_helper'

class AnimalTest < ActiveSupport::TestCase

  should belong_to :tribe
  should validate_presence_of :race
  should validate_presence_of :name

end
