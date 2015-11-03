class LeadsController < ApplicationController
  def create
    lead = Lead.new(permitted_params)
    status = if lead.save
      200
    else
      400
    end
    respond_to do |format|
      format.html {
        if lead.errors.any?
          flash[:alert] = 'Не удалось сохранить номер телефона'
        else
          flash[:notice] = 'Спасибо! Мы перезвоним вам'
        end
        redirect_to root_url
      }
      format.js {
        js_response lead, status
      }
      format.json {
        js_response lead, status
      }
    end
  end

  private

  def js_response lead, status
    if lead.errors.messages.any?
      render json: {:errors => lead.errors.messages}, :status => status
    else
      head 200
    end
  end

  def permitted_params
    params.require(:lead).permit!
  end

end
