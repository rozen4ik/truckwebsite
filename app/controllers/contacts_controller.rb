class ContactsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
    @contact = Contact.find(1)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, success: 'Успешно обновлено.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, success: 'Успешно удалено.' }
      format.json { head :no_content }
    end
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:body)
    end
end
