class Api::V1::MessagesController < Api::V1::BaseController
  before_action :set_message, only: [ :show, :update, :destroy ]
  
  def index
    @messages = Message.all
  end

  def show
  end

   def create
    @message = Message.new(message_params)
    if @message.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update 
    if @message.update(message_params)
     render :show
    else
      render_error
    end
  end

  def destroy
    @message.destroy
    # 204 http code: 
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.inspect
    params.require(:message).permit(:body)
  end

  def render_error
    render json: { errors: @message.errors.full_messages },
    status: :unprocessable_entity
  end
end