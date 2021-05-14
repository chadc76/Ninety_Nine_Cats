module ApplicationHelper

  def edit_button
    button_to "Edit #{@cat.name}", edit_cat_url(@cat), method: :get if cat_owner?
  end

  def session_env(token)
    html = token.token == session[:session_token] ? "<td>This Device</td>" : "<td>#{h(token.env)}</td>"
    html.html_safe
  end

  def cat_owner?
    @cat.owner == current_user
  end
end
