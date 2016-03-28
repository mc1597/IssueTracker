module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params,value)
      results = self.where(nil)
      filtering_params.each do |key|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end

