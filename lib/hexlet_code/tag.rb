# frozen_string_literal: true

module HexletCode
  # Создание тега
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
