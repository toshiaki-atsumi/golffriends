module PartiesHelper
 def organizer_logged_in?
    if  current_member.organizer == 'YES' 
        return true
    else
        return false
    end
 end
    
    
    
end
