require 'test_helper'

class FamilyPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family_person = family_people(:one)
  end

  test "should get index" do
    get family_people_url
    assert_response :success
  end

  test "should get new" do
    get new_family_person_url
    assert_response :success
  end

  test "should create family_person" do
    assert_difference('FamilyPerson.count') do
      post family_people_url, params: { family_person: { family_id: @family_person.family_id, person_id: @family_person.person_id, role: @family_person.role } }
    end

    assert_redirected_to family_person_url(FamilyPerson.last)
  end

  test "should show family_person" do
    get family_person_url(@family_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_family_person_url(@family_person)
    assert_response :success
  end

  test "should update family_person" do
    patch family_person_url(@family_person), params: { family_person: { family_id: @family_person.family_id, person_id: @family_person.person_id, role: @family_person.role } }
    assert_redirected_to family_person_url(@family_person)
  end

  test "should destroy family_person" do
    assert_difference('FamilyPerson.count', -1) do
      delete family_person_url(@family_person)
    end

    assert_redirected_to family_people_url
  end
end
