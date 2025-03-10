# frozen_string_literal: true

module HexletCode
  class Tag # rubocop:disable Style/Documentation
    def self.build(name, attributes = {}, content = nil)
      attrs = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
      content ? "<#{name}#{attrs}>#{content}</#{name}>" : "<#{name}#{attrs}>"
    end
  end
end
