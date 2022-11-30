class Role < ActiveRecord::Base
    
    has_many :auditions

    def actors
        #returns an array of names from the actors associated with this role
        self.auditions.map do |audition| 
            audition.actor
        end 
    end  

    def locations
        #returns an array of locations from the
        #auditions associated with this role
        self.auditions.map { |audition| audition.location }
    end

    def lead 
        #returns the first instance of the audition that was hired for this 
        #role or returns a string 'no actor has been hired for this role'
        
        found = self.auditions.find_by( hired: true )
        if found
            found
        else
            'no actor has been hired for this role'
        end
        #or ternary example
        # found ? found : 'no actor has been hired for this role'
    end

    def understudy
        #returns the second instance of the audition that was 
        #hired for this role or returns a string 'no actor has
        #been hired for understudy for this role'


        self.auditions.where( hired: true )

        #or
        # self.auditions.select {|a| a.hired ==true }

        # found = self.auditions.select {|a| a.hired == true }[1]
        # if found 
    end


end



# Roles
# Role#auditions returns all of the auditions associated with this role
# Role#actors returns an array of names from the actors associated with this role
# Role#locations returns an array of locations from the auditions associated with this role
# Role#lead returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
# Role#understudy returns the second instance of the audition that was hired for this role or returns a string 'no actor has been hired for understudy for this role'