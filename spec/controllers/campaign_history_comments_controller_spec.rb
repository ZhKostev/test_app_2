require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CampaignHistoryCommentsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # CampaignHistoryComment. As you add validations to CampaignHistoryComment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CampaignHistoryCommentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all campaign_history_comments as @campaign_history_comments" do
      campaign_history_comment = CampaignHistoryComment.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:campaign_history_comments)).to eq([campaign_history_comment])
    end
  end

  describe "GET #show" do
    it "assigns the requested campaign_history_comment as @campaign_history_comment" do
      campaign_history_comment = CampaignHistoryComment.create! valid_attributes
      get :show, {:id => campaign_history_comment.to_param}, valid_session
      expect(assigns(:campaign_history_comment)).to eq(campaign_history_comment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested campaign_history_comment as @campaign_history_comment" do
      campaign_history_comment = CampaignHistoryComment.create! valid_attributes
      get :edit, {:id => campaign_history_comment.to_param}, valid_session
      expect(assigns(:campaign_history_comment)).to eq(campaign_history_comment)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested campaign_history_comment" do
        campaign_history_comment = CampaignHistoryComment.create! valid_attributes
        put :update, {:id => campaign_history_comment.to_param, :campaign_history_comment => new_attributes}, valid_session
        campaign_history_comment.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested campaign_history_comment as @campaign_history_comment" do
        campaign_history_comment = CampaignHistoryComment.create! valid_attributes
        put :update, {:id => campaign_history_comment.to_param, :campaign_history_comment => valid_attributes}, valid_session
        expect(assigns(:campaign_history_comment)).to eq(campaign_history_comment)
      end

      it "redirects to the campaign_history_comment" do
        campaign_history_comment = CampaignHistoryComment.create! valid_attributes
        put :update, {:id => campaign_history_comment.to_param, :campaign_history_comment => valid_attributes}, valid_session
        expect(response).to redirect_to(campaign_history_comment)
      end
    end

    context "with invalid params" do
      it "assigns the campaign_history_comment as @campaign_history_comment" do
        campaign_history_comment = CampaignHistoryComment.create! valid_attributes
        put :update, {:id => campaign_history_comment.to_param, :campaign_history_comment => invalid_attributes}, valid_session
        expect(assigns(:campaign_history_comment)).to eq(campaign_history_comment)
      end

      it "re-renders the 'edit' template" do
        campaign_history_comment = CampaignHistoryComment.create! valid_attributes
        put :update, {:id => campaign_history_comment.to_param, :campaign_history_comment => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested campaign_history_comment" do
      campaign_history_comment = CampaignHistoryComment.create! valid_attributes
      expect {
        delete :destroy, {:id => campaign_history_comment.to_param}, valid_session
      }.to change(CampaignHistoryComment, :count).by(-1)
    end

    it "redirects to the campaign_history_comments list" do
      campaign_history_comment = CampaignHistoryComment.create! valid_attributes
      delete :destroy, {:id => campaign_history_comment.to_param}, valid_session
      expect(response).to redirect_to(campaign_history_comments_url)
    end
  end

end