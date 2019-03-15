class Api::V1::MappingsController < ApplicationController
  respond_to :json
  def index
    @mappings = Mapping.all
  end
end

