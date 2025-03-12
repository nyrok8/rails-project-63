# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Form, 'hexlet_code/form')
  autoload(:Html, 'hexlet_code/html')

  def self.form_for(instance, attributes = {})
    form = Form.new(instance)
    form.state << { type: :form, attributes: attributes }

    yield(form) if block_given?

    Html.render(form.state)
  end
end
