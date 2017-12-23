class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  belongs_to :order

  def total #totals up cart by line_item
    total = 0
    line_items.each {|line_item| total += (line_item.quantity*line_item.item.price)}
    total
  end

  def update_item_inventory(line_items) #an array of line_items
    line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory - line_item.quantity)
    end
  end

  def update_line_item(new_line_item)
    line_items.detect do |line_item|
      if line_item.item == new_line_item.item
        line_item[:quantity] = line_item.quantity += new_line_item.quantity
      end
    end
  end

  def add_item(item_id) #adds an item to cart or updates existing line item. also subtracts one from inventory of item
    new_line_item = LineItem.new(item_id: item_id)
    if items.include?(new_line_item.item)
      update_line_item(new_line_item)
    else
      new_line_item[:cart_id] = self.id
      new_line_item
    end

  end

end
