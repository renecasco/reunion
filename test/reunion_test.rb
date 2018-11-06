require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'
require 'pry'

class ReunionTest < Minitest::Test

    def test_it_exists
      reunion = Reunion.new("1406 BE")
      assert_instance_of Reunion, reunion
    end

    def test_it_has_name
      reunion = Reunion.new("1406 BE")
      assert_equal "1406 BE", reunion.name
    end

    def test_activities_is_empty_array_by_default
      reunion = Reunion.new("1406 BE")
      assert_equal [], reunion.activities
    end

    def test_it_can_add_activities
      reunion = Reunion.new("1406 BE")
      activity_1 = Activity.new("Brunch")
      reunion.add_activity(activity_1)
      assert_equal [activity_1], reunion.activities
    end

    def test_it_calculates_total_cost
      reunion = Reunion.new("1406 BE")
      activity_1 = Activity.new("Brunch")
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      reunion.add_activity(activity_1)
      assert_equal 60, reunion.total_cost
      activity_2 = Activity.new("Drinks")
      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)
      reunion.add_activity(activity_2)
      assert_equal 180, reunion.total_cost
    end

    def test_it_can_calculate_breakout
      reunion = Reunion.new("1406 BE")
      activity_1 = Activity.new("Brunch")
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      reunion.add_activity(activity_1)
      activity_2 = Activity.new("Drinks")
      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)
      reunion.add_activity(activity_2)
      assert_equal ({"Maria" => -10, "Luther" => -30, "Louis" => 40}), reunion.breakout
    end



end
