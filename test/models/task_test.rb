require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  should have_many(:chores)
  should have_many(:children).through(:chores)
  should validate_presence_of(:name)
  should validate_numericality_of(:points)
  should allow_value(1).for(:points)
  should allow_value(10).for(:points)
  should allow_value(100).for(:points)
  should_not allow_value("bad").for(:points)
  should_not allow_value(-2).for(:points)
  should_not allow_value(3.14159).for(:points)

  context "Creating five tasks" do
    setup do
      create_tasks
    end

    teardown do
      destroy_tasks
    end

    should "have a scope to alphabetize tasks" do
      assert_equal ["Mow grass", "Shovel driveway", "Stack wood", "Sweep floor", "Wash dishes"], Task.alphabetical.map{|t| t.name}
    end

    should "have a scope to select only active tasks" do
      assert_equal ["Mow grass", "Shovel driveway", "Sweep floor", "Wash dishes"], Task.active.alphabetical.map{|t| t.name}
    end
  end
end