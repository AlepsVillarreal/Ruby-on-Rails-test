class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new
  # Extend default Devise gem behavior so that users signing up with the pro account (plan id 2)
  # save with a special stripe suscription function.
  # otherwise Devise signs up user as usual.

  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
  
  
  #Para obligar que la persona no pueda cambiar la URL. es privado porque solo se usara este metodo dentro de este archivo. una validacion rapida pues
  private
    def select_plan
      unless (params[:plan] == '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership plan to sign up."
        redirect_to root_url
      end
    end
    
end