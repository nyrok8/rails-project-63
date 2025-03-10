# frozen_string_literal: true

module HexletCode # rubocop:disable Style/Documentation
  autoload(:Tag, 'hexlet_code/tag')

  class Html # rubocop:disable Style/Documentation
    def self.render(state)
      form = state.shift
      form[:content] = state.map do |input|
        Tag.build(input[:type].to_s, input[:attributes], input[:content])
      end.join
      Tag.build(form[:type].to_s, form[:attributes], form[:content])
    end
  end
end
