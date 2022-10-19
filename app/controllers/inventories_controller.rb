class InventoriesController < ApplicationController
    def index 
        # @user = User.find(params[:user_id].to_i)
        # @inventory = @user.inventories
        @inventories = Inventory.all
    end

    def new
        @inventory = Inventory.new
    end

    def show 
    #    @inventory = Inventory.find(params[:id])
    #    @user = @inventory.user
         @foods = @inventory.inventory_foods.includes(:food)
    end

    def create 
        @inventory_new = current_user.inventories.new(inventory_params[:id])
        respond_to do |format|
           format.html do
            if @inventory_new.save
                redirect_to "/users/#{@inventory_new.user_id}/inventories/", notice: 'Inventory successfully created'
                else
                    redirect_to :new, alert: 'Error occured while creating a new inventory'
                end
            end
        end
    end

    private

    def inventory_params
        params.require(:inventory).permit(:name)
    end
end
