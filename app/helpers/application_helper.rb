module ApplicationHelper

  def edit_button
    button_to "Edit #{@cat.name}", edit_cat_url(@cat), method: :get if cat_owner?
  end

  def cat_owner?
    current_user && @cat.user_id == current_user.id
  end
end
