class Audition < ActiveRecord::Base
    #giving method to role
    belongs_to :role 

    def call_back
        #will change the hire attribute to true
        self.update( hired: true )
        
        #other way
        # self.hired = true
        # self.save
    end
    
end


# Audition
# Audition#role returns an instance of role associated with this audition
# Audition#call_back will change the the hired attribute to true