ActiveAdmin.register Historical do

 permit_params :player_id, :source, :year, :at_bats, :home_runs, :runs_batted_in, :stolen_bases, :runs, :avg, :innings_pitched, :wins, :saves, :era, :whip, :strikeouts, :hits, :on_base_percentage, :slugging_percentage, :on_base_plus_slugging
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
