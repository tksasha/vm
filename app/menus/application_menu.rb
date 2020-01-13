# frozen_string_literal: true

require 'tty-prompt'

# TODO: try to spec it
class ApplicationMenu
  private

  def prompt
    @prompt ||= TTY::Prompt.new
  end

  class << self
    def render(*args)
      new.render(*args)
    end
  end
end
