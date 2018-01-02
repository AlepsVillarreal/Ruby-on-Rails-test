class ContactsController < ApplicationController
    
    #GET request to /contact-us (custom route)
    #Show new contact form
    def new
      @contact = Contact.new
    end
    
    #POST request to /contacts
    
    def create
        # Mass assignment of form fields into Contact object
      @contact = Contact.new(contact_params)
      #Save the Contact object to the database
      if @contact.save
         #Store form fields via parameters into variables
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
        #Plug variables into Contact Mailer email method and send email
        ContactMailer.contact_email(name, email, body).deliver 
        
        #Success message
         flash[:success] = "Message sent."
         #Redirect to the new action
         redirect_to new_contact_path
      else
          #If Contact doesn't save,
          #store errors in flash hash,
          # redirect to the new action
         flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
    end
    
    #To collect data from form, we need to use
    #Strong parameters and whitelest the form fields
    private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
end