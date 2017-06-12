require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { cohort_id: @student.cohort_id, down_payment: @student.down_payment, email: @student.email, enrollment_agreement: @student.enrollment_agreement, financially_cleared: @student.financially_cleared, first_name: @student.first_name, last_name: @student.last_name, transcript: @student.transcript, yes_we_code: @student.yes_we_code } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { cohort_id: @student.cohort_id, down_payment: @student.down_payment, email: @student.email, enrollment_agreement: @student.enrollment_agreement, financially_cleared: @student.financially_cleared, first_name: @student.first_name, last_name: @student.last_name, transcript: @student.transcript, yes_we_code: @student.yes_we_code } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
