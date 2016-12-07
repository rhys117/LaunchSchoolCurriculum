require 'minitest/autorun'
require_relative 'filename'

class Test < Minitest::Test
  def test_odd
    assert value.odd?, 'value not odd'
  end

  def test_equality
    assert_equal 'XYZ', value.downcase
  end

  def test_nil
    assert_nil value
  end

  def test_empty_object
    assert_empty list
  end

  def test_included_in_object
    assert_includes list, 'XYZ'
  end

  def test_no_experience_error
    assert_raises NoExperienceError do
      employee.hire
    end
  end

  def test_if_numeric
    assert_instance_of Numeric, value
  end

  def test_not_numeric
    assert_kind_of Numeric, value
  end

  def test_list_equalto_listprocess
    assert_same list, list.process
  end

  def test_element_not_in_array
    refute_includes list, 'XYZ'
  end
end