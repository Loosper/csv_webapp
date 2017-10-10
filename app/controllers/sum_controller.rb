require('csv')
class SumController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    total = 0
    CSV.foreach(params[:file].path) do |line|
      total += line[0].to_i
    end
    render plain: '%.2f' % total.to_f.ceil(2)
  end
end
