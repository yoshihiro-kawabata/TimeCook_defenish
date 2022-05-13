class RecipesController < ApplicationController
    before_action :login_required, only: [:edit]
    before_action :correct_user, only: [:edit]

    def index
    end
         
    def create
      redirect_to recipe_path(params[:id])
    end
    
    def show
      @recipes = Recipe.find(params[:id])
      @tasks = Task.where(recipe_id: @recipes.id)
      @data = [{ name: 'Good yen!', data: [10, 20, 30] }, { name: 'あと一歩', data: [10, 20, 30] }]
    end
  
    def edit
      userA = User.find(current_user.id)
      recipeA = Recipe.find(params[:recipe_id])
      recipesUser = RecipesUser.find_by(user_id:userA.id,recipe_id:recipeA.id)
      if recipesUser != nil
        redirect_to recipe_path(recipeA.id)
        flash[:notice] = '既に登録されています'
      else
        userA.recipes << recipeA
        redirect_to user_path(userA.id)
        flash[:notice] = 'レシピを登録しました'      
      end
    end
  
    private
  
      def correct_user
        @user = User.find(current_user.id)
        redirect_to current_user unless current_user?(@user)
      end
end