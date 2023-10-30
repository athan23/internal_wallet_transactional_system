class DepositController < BaseController
  def create
    begin
      Deposit.call(@current_entity.wallet.id, params[:amount].to_i)
      render status: :ok
    rescue Deposit::Error => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
