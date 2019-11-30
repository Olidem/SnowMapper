module ApplicationHelper
  # Devise helpers required here to make navbar login/sign-up modals functional
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Custom helpers
  def time_since(record)
    time_diff_mins = (Time.new - record.created_at).fdiv(1.minute).round
    if time_diff_mins < 60
      "#{time_diff_mins} minutes ago"
    elsif time_diff_mins.fdiv(60) < 24
      "#{time_diff_mins.fdiv(60).round} hours ago"
    else
      "#{time_diff_mins.fdiv(60).fdiv(24).round} days ago"
    end
  end

  def user_approvals_no
    admin_groups = (current_user.memberships.where(admin: true).map { |membership| membership.group })
    membership_requests = []
    admin_groups.each do |group|
      membership_requests << group.membership_requests
    end
    membership_requests.flatten.count
  end

  def no_of_unread_messages(group)
    if current_user.read_messages.where(group: group).any?
      group.messages.count - current_user.read_messages.where(group: group).first.no_of_read_messages
    end
  end
end
