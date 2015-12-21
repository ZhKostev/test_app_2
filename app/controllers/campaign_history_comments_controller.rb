class CampaignHistoryCommentsController < ApplicationController
  before_action :set_campaign_history_comment, only: [:show, :edit, :update, :destroy]

  def index
    @campaign_history_comments = CampaignHistoryComment.preload(:campaign).all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @campaign_history_comment.update(campaign_history_comment_params)
        format.html { redirect_to @campaign_history_comment, notice: 'Campaign history comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @campaign_history_comment.destroy
    respond_to do |format|
      format.html { redirect_to campaign_history_comments_url, notice: 'Campaign history comment was successfully destroyed.' }
    end
  end

  private
    def set_campaign_history_comment
      @campaign_history_comment = CampaignHistoryComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_history_comment_params
      params.require(:campaign_history_comment).permit(:comment)
    end
end
