class Api::V1::MappingsController < ApplicationController
  def index
    @mappings = Mapping.all
  end
end

