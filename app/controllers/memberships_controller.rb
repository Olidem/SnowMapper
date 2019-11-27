class MembershipsController < ApplicationController
  # before_action :set_group, only: %i[show edit update destroy]

  def user_memberships #same as index but only for memberships you are in.
    @memberships = Membership.all
  end

   def new() end

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

  # # def edit

  # # end

  def update #make admin or not.
    @membership = Membership.find(params[:id])
    @group = @membership.group
    @membership.update(membership_params)
    redirect_to edit_group_path(@group)
  end

  def destroy #remove the member from the group.
    @membership = Membership.find(params[:id])
    @group = @membership.group
    @membership.destroy
    redirect_to edit_group_path(@group)
  end

  private

  def membership_params
    params.require(:membership).permit(:admin)
  end

  # def set_membersip
  #   @membership = Membership.find(params[:id])
  # end
end
