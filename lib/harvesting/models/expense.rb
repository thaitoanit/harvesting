module Harvesting
  module Models
    # A expense record from your Harvest account.
    #
    # For more information: https://help.getharvest.com/api-v2/expenses-api/expenses/expenses/
    class Expense < HarvestRecord
      attributed :id,
                 :receipt,
                 :invoice,
                 :notes,
                 :total_cost,
                 :units,
                 :billable,
                 :is_closed,
                 :is_locked,
                 :is_billed,
                 :locked_reason,
                 :spent_date,
                 :created_at,
                 :updated_at

      modeled project: Project,
              user: User,
              client: Client,
              expense_category: ExpenseCategory,
              user_assignment: ProjectUserAssignment,
              invoice: Invoice

      def path
        @attributes['id'].nil? ? "expenses" : "expenses/#{@attributes['id']}"
      end

      def to_hash
        { project_id: project.id, client_id: client.id, user_id: user.id, expense_category_id: expense_category&.id, user_assignment_id: user_assignment&.id, invoice_id: invoice&.id }.merge(super)
      end
    end
  end
end
