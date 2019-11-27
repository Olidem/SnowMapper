class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[update destroy]

  def user_memberships #same as index but only for memberships you are in.
    @memberships = Membership.all
  end

  def create
    @group = Group.find(params[:group_id])
    @membership = Membership.new
    @membership.group = @group
    @membership.user = current_user
    if @membership.save!
      redirect_to group_path(@group)
    else
      redirect_to resort_path(@group.resort)
    end
  end

  # make admin or not.
  def update
    @group = @membership.group
    @membership.update(membership_params)
    redirect_to edit_group_path(@group)
  end

  # remove the member from the group.
  def destroy
    @group = @membership.group
    @membership.destroy
    redirect_to edit_group_path(@group)
  end

  private

  def membership_params
    params.require(:membership).permit(:admin)
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end
end
