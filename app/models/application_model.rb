# frozen_string_literal: true

require 'yaml'

# TODO: spec me
class ApplicationModel
  class << self
    attr_accessor :database

    def all
      @all ||= YAML.safe_load File.read database
    end
  end
end
