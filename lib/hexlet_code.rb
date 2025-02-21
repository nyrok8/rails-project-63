# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'slim'

module HexletCode
  def self.form_for(instance, attributes = {})
    instance.extend(ClassMetods)

    instance.tags_attrs = []
    instance.submit_attrs = {}

    yield(instance) if block_given?

    form_attrs = { action: attributes[:url] || '#', method: 'post' }.merge(attributes)

    form_render(
      form_attrs.except(:url),
      instance.tags_attrs,
      instance.submit_attrs
    )
  end

  def self.form_render(form_attrs, tags_attrs, submit_attrs)
    Slim::Engine.set_options pretty: true, sort_attrs: false
    Slim::Template.new(File.join(__dir__, 'template.slim')).render(
      Object.new,
      form_attrs: form_attrs,
      tags_attrs: tags_attrs,
      submit_attrs: submit_attrs
    )
  end

  module ClassMetods
    attr_accessor :tags_attrs, :submit_attrs

    def input(name, attributes = {})
      attrs = case attributes[:as]
              when :text
                { name: name, cols: 20, rows: 40 }
              else
                { name: name, type: 'text' }
              end
      @tags_attrs << attrs.merge(value: public_send(name).to_s, **attributes)
    end

    def submit(value = 'Save')
      @submit_attrs = { type: 'submit', value: value }
    end
  end
end
