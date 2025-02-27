# frozen_string_literal: true

module HexletCode
  # Красивый вывод формы
  class Html
    def self.render(form)
      form_with_newlines = form.gsub(/>(?=<)/, ">\n")
      lines = form_with_newlines.split("\n")
      rendered_lines = lines.map.with_index do |line, index|
        if index.zero? || index == lines.size - 1
          line
        else
          "  #{line}"
        end
      end
      rendered_lines.join("\n")
    end
  end
end
