module Harvesting
  module Models
    class Expenses < HarvestRecordCollection

      def initialize(attrs, query_opts = {}, opts = {})
        super(attrs.reject {|k,v| k == "expenses" }, query_opts, opts)
        @entries = attrs["expenses"].map do |entry|
          Expense.new(entry, client: opts[:client])
        end
      end

      def fetch_next_page
        @entries += harvest_client.tasks(next_page_query_opts).entries
        @attributes['page'] = page + 1
      end
    end
  end
end
