module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class="message_deny">
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  # def set_user
  #   if user_signed_in?
  #     @user = current_user
  #   else
  #     flash[:alert] = "You must be logged in to do that."
  #     redirect_to new_user_session_path
  #   end
  # end

  # def require_admin
  #   return if current_user.admin?
  #   flash[:alert] = "Only administrators have access to do this task."
  #   redirect_to users_path
  # end

  # def same_user(resource)
  #   return if current_user.admin? || (current_user.id == resource.user_id)
  #   type = if resource == @comment
  #            "comments"
  #          else
  #            "posts"
  #          end
  #   flash[:alert] = "You can only do this to your own #{type}!"
  #   redirect_to users_path
  # end
end
