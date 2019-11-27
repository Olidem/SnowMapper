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
end
