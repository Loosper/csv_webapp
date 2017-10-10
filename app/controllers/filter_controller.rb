require('csv')

class FilterController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    total = 0
    CSV.foreach(params[:file].path) do |line|
      total += line[1].to_i if line[2].to_i.odd?
    end
    render plain: '%.2f' % total.to_f.ceil(2)
  end
end
