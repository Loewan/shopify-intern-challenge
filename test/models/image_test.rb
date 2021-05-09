require "test_helper"

class ImageTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'Test username', email: 'test@example.com', password: 'password')
    @photo = fixture_file_upload('files/jon-snow.jpg','image/jpeg')
    @image = Image.new(title: 'Test title', description: 'test description', picture: @photo, user: @user)

  end

  test 'Image should be valid' do
    assert @image.valid?
  end

  test 'Title should be present' do
    @image.title = ''
    assert_not @image.valid?
  end

  test 'description should be present' do
    @image.description = ''
    assert_not @image.valid?
  end

  test 'photo should be present' do
    @image.picture = nil
    assert_not @image.valid?
  end
end
