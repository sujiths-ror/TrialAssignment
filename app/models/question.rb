class Question < ApplicationRecord
  extend Importable

  belongs_to :role
  belongs_to :mapping

  enum teaming_stages: [:norming, :forming, :performing, :all], _prefix: :teaming_stages
  enum conditions: [:always, :rare, :medium]
end
