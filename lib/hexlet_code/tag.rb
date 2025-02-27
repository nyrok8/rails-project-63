# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attributes = {})
      attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      if block_given?
        "<#{name} #{attrs}>#{yield}</#{name}>"
      else
        "<#{name} #{attrs}>"
      end
    end
  end
end
