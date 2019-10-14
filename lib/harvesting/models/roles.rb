module Harvesting
  module Models
    class Roles < HarvestRecordCollection

      def initialize(attrs, query_opts = {}, opts = {})
        super(attrs.reject {|k,v| k == "roles" }, query_opts, opts)
        @entries = attrs["roles"].map do |entry|
          Role.new(entry, client: opts[:client])
        end
      end

      def fetch_next_page
        @entries += harvest_client.tasks(next_page_query_opts).entries
        @attributes['page'] = page + 1
      end
    end
  end
end
