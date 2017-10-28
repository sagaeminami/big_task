module ClonesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_clones_path
    elsif action_name == 'edit'
      clone_path
    end
  end
end