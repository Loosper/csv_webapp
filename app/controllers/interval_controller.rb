require('csv')

class IntervalController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    max = nil
    CSV.foreach(params[:file].path).each_slice(30) do |set|
      total = 0
      set.each do |line|
        total += line[0].to_i
      end
      max ||= total
      max = total if total > max
    end
    render plain: '%.2f' % max.to_f
  end
end
