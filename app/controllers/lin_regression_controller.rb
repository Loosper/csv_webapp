require('csv')
require('regression.rb')

class LinRegressionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    x = []
    y = []
    CSV.foreach(params[:file].path).with_index do |line, index|
      y.push(line[0].to_i)
      x.push(index)
    end
    reg = SimpleLinearRegression.new(x, y)

    render plain: '%.6f,%.6f' % [reg.slope, reg.y_intercept]
  end
end
