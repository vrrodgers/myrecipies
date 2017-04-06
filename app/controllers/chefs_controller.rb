class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  
  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 4)
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Welcome #{@chef.chefname} to Myrecipes App!"
      redirect_to chef_path(@chef)
    else
     render 'new'
    end  
  end

  def show
    @chef = Chef.find(params[:id])
    @chef_recipes= @chef.recipes.paginate(page: params[:page], per_page: 4)
  end

  def edit
   
  end
  
  def update
    if @chef.update(chef_params)
    flash[:success] = "Your account updated successfully!"
    redirect_to @chef
        else
      render 'edit'
    end
  end
  

  

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
  end  
end