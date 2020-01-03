class User < ActiveRecord::Base
    validates(:email,:password,presence:true) # make sure someting like this doesnt exist
    validates(:email,uniqueness:true)
    validates(:password, length: {minimum: 5, maximum: 8})
end
#validATE IS AN ACTIVE RECORD FuNCTION, 
#symbols are treates as colum names,
#run these consrains b4 the .save function 


class Post < ActiveRecord::Base
    belongs_to :user
    # validates(:email,:password,presence:true) # make sure someting like this doesnt exist
    # validates(:email,uniqueness:true)
    # validates(:password, length: {minimum: 5, maximum: 8})
end