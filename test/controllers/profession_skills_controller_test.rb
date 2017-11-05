require 'test_helper'

class ProfessionSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profession_skill = profession_skills(:one)
  end

  test "should get index" do
    get profession_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_profession_skill_url
    assert_response :success
  end

  test "should create profession_skill" do
    assert_difference('ProfessionSkill.count') do
      post profession_skills_url, params: { profession_skill: { title: @profession_skill.title } }
    end

    assert_redirected_to profession_skill_url(ProfessionSkill.last)
  end

  test "should show profession_skill" do
    get profession_skill_url(@profession_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_profession_skill_url(@profession_skill)
    assert_response :success
  end

  test "should update profession_skill" do
    patch profession_skill_url(@profession_skill), params: { profession_skill: { title: @profession_skill.title } }
    assert_redirected_to profession_skill_url(@profession_skill)
  end

  test "should destroy profession_skill" do
    assert_difference('ProfessionSkill.count', -1) do
      delete profession_skill_url(@profession_skill)
    end

    assert_redirected_to profession_skills_url
  end
end
