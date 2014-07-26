class RemoveSymbolFromCurrency < ActiveRecord::Migration
  def change
        remove_column :currencies, :symbol
  end
end
