class GroupsController < ApplicationController
  # before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def show
    @group = Group.find(params[:id])

    @membership = Membership.new(user: current_user, group: @group, admin: true)
    @message = @flat.reviews
  end

  # def new
  #   @group = Group.new
  # end

  # def create
  #   @group = Group.new(group_params)
  #   @membership = Membership.new(admin: true, group: @group, user: @user)

  #   @group.resort = @resort

  #   @group.user = current_user

  #   if @group.save!
  #     redirect_to group_path(@group)
  #   else
  #     render 'groups/show'
  #   end
  # end

  # def edit() end

  # def update
  #   @flat.update(flat_params)
  #   redirect_to flat_path
  # end

  # def destroy
  #   @flat.destroy
  #   redirect_to flats_path
  # end

private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  # def set_group
  #   @group = Group.find(params[:id])
  # end
end
