class Api::ReportsController < Api::BaseController
  def show
    if (report_generator = ReportGenerator.new(params.merge(:campaign_id => params[:id]))).generate
      render :json => CampaignJsonDecorator.new(Campaign.where(:campaign_id => params[:id]).last).info
    else
      render :json => error_json(report_generator.errors.join(', ')), :status => 422
    end
  end
end
