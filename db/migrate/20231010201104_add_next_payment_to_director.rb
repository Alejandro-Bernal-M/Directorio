class AddNextPaymentToDirector < ActiveRecord::Migration[7.0]
  def change
    add_column :directors, :next_payment, :timestamp
  end
end
