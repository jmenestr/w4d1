class ContactShares < ApplicationController
  def create
    @contact_share = ContactShare.new(cs_params)
    if @contact_share.save
      render json: @contact_share
    else
      render json: @contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact_share = ContactShare.find(params[:id])
    if @contact_share.destroy
      render json: @contact_share
    else
      render text: "Could not destroy record", status: :unprocessable_entity
    end
  end

  private
  def cs_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end
