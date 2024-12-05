class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:create]

  def index
    @reservations = current_user.reservations.includes(:room).order(created_at: :desc)
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.new(reservation_params)
    @days = (@reservation.check_out_date - @reservation.check_in_date).to_i
    @reservation.total_price = @room.price * @reservation.guests_count * @days

    if @reservation.check_in_date >= @reservation.check_out_date
      flash[:notice] = "チェックアウト日はチェックイン日より後の日付を選択してください"
      render "rooms/show", status: :unprocessable_entity
    end
  end

  def create
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to reservations_path, notice: "予約が確定しました！"
    else
      flash[:notice] = "予約の保存に失敗しました。もう一度お試しください。"
      redirect_to room_path(@room, check_in_date: @reservation.check_in_date, check_out_date: @reservation.check_out_date, guests_count: @reservation.guests_count)
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.permit(:check_in_date, :check_out_date, :guests_count, :total_price)
  end

end
