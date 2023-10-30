class TransferController < BaseController
  def create
    begin
      Transfer.call(@current_entity.wallet.id, params[:target], params[:amount].to_i)
      render status: :ok
    rescue Transfer::Error => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
