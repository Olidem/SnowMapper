class MembershipRequestsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @membership_request = MembershipRequest.new(set_params)
    @membership_request.group = @group
    @membership_request.user = current_user
    @membership_request.save!

    # add approval functionality? default should be false

    redirect_to resort_path(@group.resort)
  end

  private

  def set_params
    params.require(:membership_request).permit(:content)
  end
end
