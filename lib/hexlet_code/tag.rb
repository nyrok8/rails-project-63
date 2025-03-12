# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(data)
      name, attributes, content = data.values_at(:type, :attributes, :content)
      attributes ||= {}

      attrs = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
      content ? "<#{name}#{attrs}>#{content}</#{name}>" : "<#{name}#{attrs}>"
    end
  end
end
