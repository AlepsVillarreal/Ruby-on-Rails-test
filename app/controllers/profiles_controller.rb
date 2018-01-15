class ProfilesController < ApplicationController
    
    #Cuando un usuario haga un GET request a /users/users_id/profile/new
    
    def new
        #Render a blank profile detail form
        @profile = Profile.new
    end
    
end