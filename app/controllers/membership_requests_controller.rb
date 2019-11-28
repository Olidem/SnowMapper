class MembershipRequestsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @membership_request = MembershipRequest.new(set_params)
    @membership_request.group = @group
    @membership_request.user = current_user
    @membership_request.save!
    redirect_to resort_path(@group.resort)
  end

  def my_approvals
    admin_groups = (current_user.memberships.where(admin: true).map { |membership| membership.group })
    @membership_requests = []
    admin_groups.each do |group|
      @membership_requests << group.membership_requests
    end
    @membership_requests.flatten!
  end

  private

  def set_params
    params.require(:membership_request).permit(:content)
  end
end
