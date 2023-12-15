class Order < ApplicationRecord
    belongs_to :customer

    validates :product_name, presence: true, 
              format: { without: /\d/, message: "should not contain integers" }, 
              length: {maximum: 30}
    validates :product_count, presence: true,
              numericality: {only_integer: true, greater_than: 0}
  end
