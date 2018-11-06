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

end
