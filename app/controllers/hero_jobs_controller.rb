class HeroJobsController < ApplicationController
  def index
    render json: { jobs: HeroJob.available_jobs }
  end
end
