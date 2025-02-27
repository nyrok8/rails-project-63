# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Html, 'hexlet_code/html')
  autoload(:Tag, 'hexlet_code/tag')

  def self.form_for(instance, attributes = {})
    form_builder = FormBuilder.new(instance)
    yield(form_builder) if block_given?

    form_attributes = {
      action: attributes.fetch(:url, '#'),
      method: 'post'
    }.merge(attributes.except(:url))

    Html.render(Tag.build('form', form_attributes) { form_builder.fields.join })
  end

  class FormBuilder
    attr_reader :fields

    def initialize(instance)
      @instance = instance
      @fields = []
    end

    def input(name, attributes = {})
      value = @instance.public_send(name)
      label_tag = Tag.build('label', for: name) { name.capitalize }
      input_tag = case attributes.delete(:as)
                  when :text
                    textarea_attrs = { name: name, cols: '20', rows: '40' }.merge(attributes)
                    Tag.build('textarea', textarea_attrs) { value }
                  else
                    Tag.build('input', { name: name, type: 'text', value: value }.merge(attributes))
                  end
      @fields.push(label_tag, input_tag)
    end

    def submit(value = 'Save')
      submit_tag = Tag.build('input', { type: 'submit', value: value })
      @fields.push(submit_tag)
    end
  end
end
