# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Html
    def self.render(state)
      form_data = transform_to_form_data(state.shift)
      form_data[:content] = state.map do |tag|
        tag_data = transform_data(tag)
        label = tag[:type] == :submit ? '' : Tag.build(transform_to_label_data(tag[:name]))
        label + Tag.build(tag_data)
      end.join
      Tag.build(form_data)
    end

    def self.transform_data(tag)
      case tag[:type]
      when :input then transform_to_input_data(tag)
      when :textarea then transform_to_textarea_data(tag)
      when :submit then transform_to_submit_data(tag)
      end
    end

    def self.transform_to_input_data(tag)
      {
        type: :input,
        attributes: { name: tag[:name], type: 'text', value: tag[:value] }.merge(tag[:attributes])
      }
    end

    def self.transform_to_textarea_data(tag)
      {
        type: :textarea,
        attributes: { name: tag[:name], cols: '20', rows: '40' }.merge(tag[:attributes]),
        content: tag[:value]
      }
    end

    def self.transform_to_submit_data(tag)
      {
        type: :input,
        attributes: { type: 'submit', value: tag[:value] }
      }
    end

    def self.transform_to_form_data(tag)
      {
        type: :form,
        attributes: { action: tag[:attributes].fetch(:url, '#'), method: 'post' }.merge(tag[:attributes].except(:url))
      }
    end

    def self.transform_to_label_data(tag_name)
      {
        type: :label,
        attributes: { for: tag_name },
        content: tag_name.capitalize
      }
    end
  end
end
