require "test_helper"

class PositionTest < ActiveSupport::TestCase
  setup do
    @postion = Position.new
    @one = positions(:one)
  end

  #Unit testing
  test "should save position" do
    assert @position.save
  end

  test "should find position" do
    @position.title = "VP Sales"
    @position.description = "Ut labore et dolore magna aliqua"
    @position.save
    expected_position = Position.find(@position.id)
    assert_equal(expected_position.title, @position.title)
    assert_equal(expected_position.description, @position.description)
  end

  test "should delete position" do
    @position.save
    assert_difference("Positon.count", -1) do
      @position.destroy
    end
  end

  test "should update position" do
    one_update_title = "Environmental Specialist"
    @one_position.update({
      title: one_update_title
    })
    assert_equal(one_update_title, @one_position.title)
  end

end
