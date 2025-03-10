# frozen_string_literal: true

module HexletCode
  class Form # rubocop:disable Style/Documentation
    attr_reader :state

    def initialize(instance)
      @instance = instance
      @state = []
    end

    def input(name, attributes = {})
      value = @instance.public_send(name)
      @state << { type: :label, attributes: { for: name }, content: name.capitalize }
      @state << case attributes.delete(:as)
                when :text
                  { type: :textarea, attributes: { name: name, cols: '20', rows: '40' }.merge(attributes),
                    content: value }
                else
                  { type: :input, attributes: { name: name, type: 'text', value: value }.merge(attributes) }
                end
    end

    def submit(value = 'Save', attributes = {})
      @state << { type: :input, attributes: { type: 'submit', value: value }.merge(attributes) }
    end
  end
end
