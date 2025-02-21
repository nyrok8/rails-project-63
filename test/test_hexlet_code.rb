# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

class TestHexletCode < Minitest::Test
  def setup
    @user = User.new(name: 'rob', job: 'hexlet')
  end

  def test_empty_form
    expected = <<~HTML.chomp
      <form action="/profile" method="post" class="hexlet-form">
      </form>
    HTML

    result = HexletCode.form_for @user, url: '/profile', class: 'hexlet-form'

    assert_equal expected, result
  end

  def test_input
    expected = <<~HTML.chomp
      <form action="#" method="post">
        <label for="name">Name</label>
        <input name="name" type="text" value="rob" class="user-input" />
      </form>
    HTML

    result = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
    end

    assert_equal expected, result
  end

  def test_textarea
    expected = <<~HTML.chomp
      <form action="#" method="post">
        <label for="job">Job</label>
        <textarea name="job" cols="50" rows="50">hexlet</textarea>
      </form>
    HTML

    result = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal expected, result
  end

  def test_input_for_missing_param
    assert_raises(NoMethodError) do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end
  end

  def test_submit
    expected = <<~HTML.chomp
      <form action="#" method="post">
        <input type="submit" value="Wow" />
      </form>
    HTML

    result = HexletCode.form_for @user do |f|
      f.submit 'Wow'
    end

    assert_equal expected, result
  end
end
