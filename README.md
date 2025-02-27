![CI Status](https://github.com/nyrok8/rails-project-63/actions/workflows/main.yml/badge.svg)
![hexlet-check](https://github.com/nyrok8/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

# HexletCode

HexletCode — это Ruby-gem для генерации HTML-форм на основе объектов.

## Использование

### Определение структуры пользователя

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new(name: 'rob', job: 'hexlet')
```

### Генерация формы

```ruby
require 'hexlet_code'

puts HexletCode.form_for user do |f|
  f.input :name, class: 'user-input'
  f.input :job, as: :text, rows: 50, cols: 50
  f.submit 'Save'
end
```

Выходные данные:

```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob" class="user-input">
  <label for="job">Job</label>
  <textarea name="job" cols="50" rows="50">hexlet</textarea>
  <input type="submit" value="Save">
</form>
```