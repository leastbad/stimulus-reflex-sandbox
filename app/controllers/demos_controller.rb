class DemosController < ApplicationController
  def show
    @count ||= 0
  end
end