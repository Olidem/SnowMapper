class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[update destroy]
  before_action :set_group, only: %i[update destroy]
  # same as index but only for memberships you are in, please see view for logic.
  # create for dev/test purposes first. Logic to be added to the drop down in the navbar.
  def user_memberships
    @memberships = current_user.memberships # Membership.where(user: current_user)
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
    @membership.update(membership_params)
    redirect_to edit_group_path(@group)
  end

  # remove the member from the group.
  def destroy
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

  def set_group
    @group = @membership.group
  end
end
