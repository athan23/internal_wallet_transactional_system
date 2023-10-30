class WithdrawController < BaseController
  def create
    begin
      Withdraw.call(@current_entity.wallet.id, params[:amount].to_i)
      render status: :ok
    rescue Withdraw::Error => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
