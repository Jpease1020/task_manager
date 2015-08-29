require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_it_assignes_the_proper_attributes
    attributes = {:description => "This task", :title => 'New task'}
    task = Task.new(attributes)

    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end
end
