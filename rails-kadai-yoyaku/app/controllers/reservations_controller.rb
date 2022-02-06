class ReservationsController < ApplicationController

  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @post = Post.find(params[:post_id])
    if @reservation.invalid?
      render :show
    end
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
  end

  def show
    @post = Post.find(params[:id])
    @reservation = Reservation.new
  end

  def back
    @reservation = Reservation.new(reservation_params)
    @post = Post.find(params[:format])
		render :show
	end

  def complete
	  current_user.reservations.create!(reservation_params)
    @post = Post.find(params[:format])
    @reservation = Reservation.new(reservation_params)
	end

  def edit
  end

  def update
  end

  def destroy
    Reservation.find_by(id: params[:id],post_id: params[:post_id]).destroy
    flash[:notice] = "予約を削除しました"
    redirect_to :post_reservations
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_reservations, :post_id)
  end

end
