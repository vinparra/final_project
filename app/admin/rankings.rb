ActiveAdmin.register Ranking do

 permit_params :player_id, :source, :overall_rank, :position_rank, :dollar_value, :rank_best, :rank_worst, :rank_average, :rank_std_dev, :avg_draft_position
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
