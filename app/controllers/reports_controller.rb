class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    @category_report = Operation.category_data(params[:start_date], params[:last_date], params[:operation][:otype])
    @category_dates = @category_report.map do |key|
      key[1]
    end
    @category_id = @category_report.map do |value|
      result = Category.find_by(id: value)
      result.name
    end
    @date_title = {'first_date' => params[:start_date], 'end_date' => params[:last_date]}
    @otype = {'otype' => params[:operation][:otype]}
  end

  def report_by_dates
    operations_report = Operation.transfer_data(params[:start_date], params[:last_date], params[:operation][:otype], params[:operation][:category_id])
    @dates = operations_report.map do |key|
      key[0].strftime("%Y-%m-%d")
    end
    @sum = operations_report.map do |value|
      value[1]
    end
  end
end
