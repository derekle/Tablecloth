require "test_helper"

class UserTest < ActiveSupport::TestCase
  before_action
  # test "the truth" do
  #   assert true
  # end

  test 'needs a username' do
    puts 'users need a username.'
    noname = User.new
    withname = User.new(username: 'hanekawa')
    assert_not  noname.save, 'can save without a username'
    assert withname.save, "cannot save with username"
  end
end
