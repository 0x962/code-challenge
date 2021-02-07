class InvoicesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount, :status
end
