# frozen_string_literal: true

require 'test_helper'
require_relative '../../db/seeds_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:task1)
    @attributes = generate_attributes
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
  end

  test 'should show task' do
    get task_url(@task)
    assert_response :success
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
  end

  test 'should create task' do
    post tasks_url, params: { task: @attributes }

    task = Task.find_by! name: @attributes[:name]

    assert_redirected_to task_url(task)
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'should update task' do
    patch task_url(@task), params: { task: @attributes }
    assert_redirected_to task_url(@task)

    @task.reload

    assert { @task.name == @attributes[:name] }
  end

  test 'should destroy task' do
    delete task_url(@task)

    assert_redirected_to tasks_url

    assert { !Task.exists? @task.id }
  end
end
