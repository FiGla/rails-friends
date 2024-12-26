class ChildrenController < ApplicationController
  before_action :set_child, only: %i[ show edit update destroy ]

  # GET /children/new
  def new
    @child = Child.new
    @friend = Friend.find(params[:friend_id])
    @url = friend_children_path(@friend)
  end

  # GET /children/1/edit
  def edit
    @friend = @child.friend
    @url = friend_child_path(@friend, @child)
  end

  # POST /children or /children.json
  def create
    @friend = Friend.find(params[:friend_id])
    @child = @friend.children.create(child_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to friend_path(@friend), notice: "Child was successfully created." }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /children/1 or /children/1.json
  def update
    @friend = @child.friend
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to friend_path(@friend), notice: "Child was successfully updated." }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1 or /children/1.json
  def destroy
    @friend = @child.friend
    @child.destroy

    respond_to do |format|
      format.html { redirect_to friend_path(@friend), status: :see_other, notice: "Child was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def child_params
      params.require(:child).permit(:name, :date_of_birth)
    end
end
