# Service to create chambas in the database

class ChambasController < ApplicationController
  @chamba_record_save = nil

  
  def create
    @chamba = Chamba.new(chamba_params)
    if @chamba.save
      @chamba_record_save = true
    else
      @chamba_record_save = false
      render admin_path
    end
  end

  private

  def chamba_params
    params.require(:chamba).permit(:title, :exp_date, :location, :description, :organization, :salary)
  end
end
