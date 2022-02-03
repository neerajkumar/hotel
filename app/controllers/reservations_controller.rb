class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    @rooms = Room.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @room = Room.new
    rooms = Room.where(occupied: false).order(:room_number)
    @all_rooms = rooms.uniq { |room| room.room_number}
    @floors = rooms.map(&:floor).uniq
    @guests = Guest.all
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @room = Room.find_by!(room_number: reservation_params[:room_number], floor: reservation_params[:floor])
    rooms = Room.where(occupied: false).order(:room_number)
    @all_rooms = rooms.uniq { |room| room.room_number}
    @floors = rooms.map(&:floor).uniq
    @guests = Guest.all
    if @room.occupied && reservation_params[:occupied] == "1"
      @room.errors.add(:base, "Can't reserve already occupied room")
    end

    respond_to do |format|
      if @room.errors.full_messages.empty? && @room.update(reservation_params)
        format.html { redirect_to reservations_path, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.permit(:room_number, :floor, :occupied)
    end
end
