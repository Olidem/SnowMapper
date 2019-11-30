class MembershipRequestsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @membership_request = MembershipRequest.new(set_params)
    @membership_request.group = @group
    @membership_request.user = current_user
    @membership_request.save!
    redirect_to resort_path(@group.resort)
  end

  def approve
    memberships_approvals_set
    @membership_request = MembershipRequest.find(params[:id])
    @membership = Membership.new
    @membership.user = @membership_request.user
    @membership.group = @membership_request.group
    @membership.save!
    @membership_request.delete
    redirect_to membership_requests_my_approvals_path
  end

  def reject
    memberships_approvals_set
    @membership_request = MembershipRequest.find(params[:id])
    @membership_request.delete
    redirect_to membership_requests_my_approvals_path
  end

  # Notification center methods
  def notifications_center
    memberships_approvals_set
    @memberships = current_user.memberships
  end

  private

  def set_params
    params.require(:membership_request).permit(:content)
  end

  def memberships_approvals_set
    admin_groups = (current_user.memberships.where(admin: true).map { |membership| membership.group })
    @membership_requests = []
    admin_groups.each do |group|
      @membership_requests << group.membership_requests
    end
    @membership_requests.flatten!
  end
end
