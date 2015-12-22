class ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def show
    @campaign = Campaign.includes(:creatives).find(params[:id])
    respond_to { |format| format.pdf { render :pdf => "show" } }
  end

  def create
    if (@report_generator = ReportGenerator.new(params)).generate
      render :new
    else
      render :new, :status => 422
    end
  end
end
