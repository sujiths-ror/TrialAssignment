class Api::V1::RolesController < ApplicationController
  respond_to :json
  def index
    @roles = Role.all
  end
end

