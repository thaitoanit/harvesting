module Harvesting
  module Models
    # A role record from your Harvest account.
    #
    # For more information: https://help.getharvest.com/api-v2/roles-api/roles/roles/
    class Role < HarvestRecord
      attributed :id,
                 :name,
                 :user_ids,
                 :default_hourly_rate,
                 :created_at,
                 :updated_at,
      def path
        @attributes['id'].nil? ? "roles" : "roles/#{@attributes['id']}"
      end
    end
  end
end
