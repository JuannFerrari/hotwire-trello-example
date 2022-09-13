class ColumnsController < ApplicationController
  before_action :set_column, only: %i[ show edit update destroy ]

  # GET boards/:id/columns or /columns.json
  def index
    @columns = Column.all
  end

  # GET boards/:id/columns/1 or /columns/1.json
  def show
  end

  # GET boards/:id/columns/new
  def new
    @column = Column.new
  end

  # GET boards/:id/columns/1/edit
  def edit
  end

  # POST boards/:id/columns or /columns.json
  def create
    @column = Column.new(column_params)
    if @column.save
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Column was successfully created."})
    else
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Column could not be created."})
    end
  end

  # PATCH/PUT boards/:id/columns/1 or /columns/1.json
  def update
    if @column.update(column_params)
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Column was successfully updated."})
    else
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Column could not be updated."})
    end
  end

  # DELETE boards/:id/columns/1 or /columns/1.json
  def destroy
    @column.destroy!
    render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
      locals: {message: "Column was successfully destroyed."})
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = Column.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def column_params
      params.require(:column).permit(:name, :board_id)
    end
end
