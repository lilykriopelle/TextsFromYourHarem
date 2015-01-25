class AddPlanIdToDelayedJobs < ActiveRecord::Migration
  def change
    add_column :delayed_jobs, :plan_id, :integer
  end
end
