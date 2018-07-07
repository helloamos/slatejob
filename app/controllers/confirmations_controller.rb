class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource)
    create_profile_path
  end
end