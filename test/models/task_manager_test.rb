require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task

    attributes = {:description => "This task", :title => 'New task'}
    task = TaskManager.create(attributes)

    assert_equal "This task", task.description
    assert_equal "New task", task.title

  end

  def test_it_updates_a_task
    task = TaskManager.create({ :title       => "a title",
                                :description => "a description"})
    assert_equal "a title", task.title
    task.title = "an updated title"

    TaskManager.update(task.id, task)
    assert_equal "an updated title", task.title
  end

end



# As a [user],
# When I [perform an action],
# And I [perform an action],
# And I [perform an action],
# Then [expected result].

# As a user, when I go to the home page, I expect to see a descriptino of what this
# program does and how to use it and maybe something that guides me
# to the task form.
# when I submit a task into the form, I expect to see
# a list of my tasks with the new one on it on the same page.
# And when I click on the task list, I expect to see a description of
# that task, its completion status, and any other releveant data.
# When I finish a task, I expect to see something on the page change....maybe
# the task is crossed out or deleted all together.
