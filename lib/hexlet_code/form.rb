# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :state

    def initialize(instance)
      @instance = instance
      @state = []
    end

    def input(name, attributes = {})
      @state << {
        type: input_type(attributes.delete(:as)),
        name: name,
        value: @instance.public_send(name),
        attributes: attributes
      }
    end

    def submit(value = 'Save', attributes = {})
      @state << {
        type: :submit,
        attributes: attributes,
        value: value
      }
    end

    private

    def input_type(type)
      case type
      when :text
        :textarea
      else
        :input
      end
    end
  end
end
