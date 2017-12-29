class ContactMailer < ActionMailer::Base
 default to: 'posdata.5@hotmail.com'
 
 def contact_email(name, mail, body)
     @name = name
     @mail = mail
     @body = body
 
    mail(from: email, subject: 'Contact Form Message')
 end
end