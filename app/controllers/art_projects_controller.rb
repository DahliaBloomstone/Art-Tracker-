class ArtProjectsController < ApplicationController 
    before_action :set_art_project, only: [:show, :edit, :update]

    def index 
    if params[:art_plan_id] && artplan = ArtPlan.find_by_id(params[:art_plan_id])
    @art_projects = artplan.art_projects
    else
     @art_projects = current_user.art_projects
     end
end 

    def show 
    end 

    def edit
    end 

    def update 
        set_art_project
        redirect_if_not_logged_in 
        if @art_project.update(art_project_params)
            flash[:success] = "Your art project has been updated!"
            redirect_to art_project_path(@art_project)
        else 
            render :edit 
        end 
    end 


    private 
    def art_project_params 
        params.require(:art_project).permit(:medium, :day, :idea, :artist_reference, :content, :price)
    end 

    def set_art_project 
        @art_project = ArtProject.find_by(id: params[:id])
        if !@art_project 
            flash[:dancer] = "Art Project Not Found! Try Again!"
            redirect_to art_projects_path 
        end 
    end 

    
end

# will_paginate is a pagination library that integrates with Ruby on Rails, Sinatra, Hanami::View, Merb, DataMapper and Sequel.
#Installation:
## Gemfile for Rails 3+, Sinatra, and Merb
#gem 'will_paginate', '~> 3.1.0'