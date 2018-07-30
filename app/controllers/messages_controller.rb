class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @form = MessageForm.new(Message.new)
    # @message = Message.new
  end

  # GET /messages/1/edit
  def edit
    @form = MessageForm.new(@message)
  end

  # POST /messages
  # POST /messages.json
  def create
    @form = MessageForm.new(Message.new)

    # respond_to do |format|
      if @form.validate(params[:message])
        @form.save
        flash[:success] = "yes"
        redirect_to users_url
        # format.html { redirect_to @message, notice: 'Message was successfully created.' }
        # format.json { render :show, status: :created, location: @message }
      else
        render :new
        # flash[:alert] = "no"
        # redirect_to root_url
        # format.html { render :new }
        # format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :title, :content, :length)
    end
end
