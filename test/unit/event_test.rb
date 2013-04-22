require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def new_event(attributes ={})
    attributes[:id] || = 1
    attributes[:title] || = 'Holiday'
    attributes[:body] || = 'Trip abroad coming soon'

    event = Event.new(attributes)
    event
  end

  def test_even_should_have_one_id
    assert_equal '10', event(:one).approved
  end
end
