class TicketsController < ApplicationController
  before_filter :load_flight

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = @flight.tickets.all order: :created_at

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = @flight.tickets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = @flight.tickets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = @flight.tickets.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = @flight.tickets.build(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to [@flight, @ticket], notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = @flight.tickets.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to [@flight, @ticket], notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = @flight.tickets.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to flight_tickets_url(@flight) }
      format.json { head :no_content }
    end
  end

  private

  def load_flight
    @flight = Flight.find params[:flight_id]
  end
end
