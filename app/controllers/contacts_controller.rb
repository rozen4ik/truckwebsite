class ContactsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_contact, only: [:edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contact = Contact.find(1)
  end


  # GET /contacts/1/edit
  def edit
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, success: 'Успешно обновлено.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, success: 'Успешно удалено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:body)
    end
end
