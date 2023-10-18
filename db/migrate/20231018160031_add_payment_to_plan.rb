class AddPaymentToPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :stripe_plan_name, :string
    add_column :plans, :paypal_plan_name, :string

  end
end
