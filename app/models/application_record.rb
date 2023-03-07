# frozen_string_literal: true

# Application Record
# This class is the base class for all models.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
