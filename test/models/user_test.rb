require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: 'Test username', email: 'test@example.com', password: 'password')
  end

  test 'User should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = ''
    assert_not @user.valid?
  end

  test 'username should be unique' do
    @user.save
    @user2 = User.new(username: 'Test username', email: 'test2@example.com', password: 'password')
    assert_not @user2.valid?
  end

  test 'email should be unique' do
    @user.save
    @user2 = User.new(username: 'Test username 2', email: 'test@example.com', password: 'password')
    assert_not @user2.valid?
  end

  test 'username should not be too long' do
    @user.username = 'a' * 26
    assert_not @user.valid?
  end

  test 'username should not be too short' do
    @user.username = '1'
    assert_not @user.valid?
  end

  test 'email should be formatted correctly' do
    @user.email = 'notrealemailformat'
    assert_not @user.valid?
  end
end
