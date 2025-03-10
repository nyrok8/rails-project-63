# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

class TestHexletCode < Minitest::Test
  def setup
    @user = User.new(name: 'rob', job: 'hexlet')
  end

  def test_empty_form
    expected = File.read(File.join(__dir__, 'fixtures/empty_form.html'))
    result = HexletCode.form_for @user, url: '/profile', class: 'hexlet-form'

    assert_equal expected, result
  end

  def test_input
    expected = File.read(File.join(__dir__, 'fixtures/input.html'))
    result = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
    end

    assert_equal expected, result
  end

  def test_textarea
    expected = File.read(File.join(__dir__, 'fixtures/textarea.html'))

    result = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal expected, result
  end

  def test_submit
    expected = File.read(File.join(__dir__, 'fixtures/submit.html'))
    result = HexletCode.form_for @user do |f|
      f.submit 'Wow'
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
end
