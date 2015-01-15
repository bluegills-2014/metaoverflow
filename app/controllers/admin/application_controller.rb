class Admin::ApplicationController < ApplicationController
  before_action :force_login
  before_action :force_admin_for_non_reads, expect: [:index, :show, :new, :create]

  def force_login
    unless current_user
      flash[:notice] = "You're not authorized to be here, please log in."
      redirect_to login_path
    end
  end

  def force_admin_for_non_reads
    redirect_to admin_root_path unless current_user
  end
end
