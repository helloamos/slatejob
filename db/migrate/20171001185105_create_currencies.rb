class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :currency_symbol
      t.string :iso_code

      t.timestamps
    end
  end
end
