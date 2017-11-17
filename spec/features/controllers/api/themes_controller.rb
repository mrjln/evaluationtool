class Api::ThemesController < ApplicationController
  def index
    render status: 200, json: {
      themes: Theme.all
    }.to_json
  end

  def show
    theme = Theme.find(params[:id])
    render status: 200, json: {
      theme: theme
    }.to_json
  end

  def create
    theme = Theme.new(theme_params)

    if theme.save
      render status: 201, json: {
        message: "theme succesfully created",
        theme: theme
      }.to_json
    else
      render status: 422, json:{
        errors: theme.errors
      }.to_json
    end
  end


  def destroy
    theme = Theme.find(params[:id])
    theme.destroy

    render status: 200, json: {
      message: "BOOM theme: '#{theme.name}' deleted"
    }.to_json
  end

  def update
    theme = Theme.find(params[:id])
    if theme.update(theme_params)
      render status: 200, json: {
        message: "theme updated",
        theme: theme
      }.to_json
    else
       render status: 422, json: {
        message: "The theme could not be updated",
        errors: theme.errors
      }.to_json
    end
  end

end
