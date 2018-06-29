class GroupsController < ApplicationController

  def index
    @group = Group.all
  end

  def new
    @group = Group.new
  end
  
  def show
    @group = Group.find(params[:id])
    @members = User.in_group(@group)

  end

  def join
    @group = Group.find(params[:id])
    @group.add current_user
  end

  def edit
    @group = Group.find(params[:id])
  end


  def create
    @group = Group.new(group_params)
    respond_to do |format|
    if @group.save
      @group.add(current_user, as: 'Captain')
      format.html { redirect_to @group, notice: 'Group was successfully created.' }
      format.json { render :show, status: :created, location: @group}
    else
      format.html { render :new }
      format.json { render json: @group.errors, status: :unprocessable_entity }
    end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private

  def group_params
  	params.require(:group).permit(:location, :description, :sport, :name)
  end




end
