module OrganizerHelper
  def organizer_logged_in?
    organizer == current_member
  end
end
