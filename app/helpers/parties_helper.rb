module PartiesHelper
 def organizer_logged_in?
    if  $current_party == nil
        return false
    elsif  $current_party.member_id == current_member.id
        return true
    else
        return false
    end
 end
    
    
    
end
