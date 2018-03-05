ActiveAdmin.register Projection do

 permit_params :player_id, :source, :year, :ab, :hr, :rbi, :sb, :runs, :avg, :innings_pitched, :wins, :saves, :era, :whip, :strikeouts
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
