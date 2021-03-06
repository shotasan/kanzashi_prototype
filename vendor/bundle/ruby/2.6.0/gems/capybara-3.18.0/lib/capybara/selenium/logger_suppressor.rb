# frozen_string_literal: true

module Capybara
  module Selenium
    module DeprecationSuppressor
      def deprecate(*)
        super unless @suppress_for_capybara
      end

      def suppress_deprecations
        prev_suppress_for_capybara, @suppress_for_capybara = @suppress_for_capybara, true
        yield
      ensure
        @suppress_for_capybara = prev_suppress_for_capybara
      end
    end

    module ErrorSuppressor
      def for_code(*)
        ::Selenium::WebDriver.logger.suppress_deprecations do
          super
        end
      end
    end
  end
end

Selenium::WebDriver::Logger.prepend Capybara::Selenium::DeprecationSuppressor
Selenium::WebDriver::Error.singleton_class.prepend Capybara::Selenium::ErrorSuppressor
