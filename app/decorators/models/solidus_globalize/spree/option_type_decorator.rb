# frozen_string_literal: true

module SolidusGlobalize
  module Spree
    module OptionTypeDecorator
      def self.prepended(base)
        translatable_fields = ::SolidusGlobalize::Config.translatable_fields[base.to_s]
        base.class_eval do
          translates(*translatable_fields, fallbacks_for_empty_translations: true)
          include SolidusGlobalize::Translatable
        end
      end

      ::Spree::OptionType.prepend self
    end
  end
end
