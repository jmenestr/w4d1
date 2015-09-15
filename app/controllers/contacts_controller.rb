class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    all_contacts = @user.contacts.to_a + @user.shared_contacts.to_a
    render json:all_contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact
      render json: @contact
    else
      render json: 'no contact'
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      render json: @contact
    else
      render json: "error deleting"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :name, :user_id)
  end
end
