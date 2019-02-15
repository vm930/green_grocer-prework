require 'pry'

def consolidate_cart(cart)
  consolidated_cart = {}
  
  cart.each do |hash| #{},{},{}
    hash.each do |key, value_hash| # "avocado" => {}
      value_hash.each do |key2, value2| # :price => 3.0
      #binding.pry
      #consolidated_cart[key] = {key => value_hash} 
      if !(consolidated_cart.has_key?(key))
        consolidated_cart[key] = {key => value_hash}
        consolidated_cart[key][:count] = 1
        else
        if consolidated_cart[key][key2].has_key?(:count)
        consolidated_cart[key][:count] +=1
        end 
      end 
    end 
  end
end 
  consolidated_cart
end 






# def consolidate_cart(cart)
#   cart.each_with_object({}) do |item, result|
#     item.each do |type, attributes|
#       if result[type]
#         attributes[:count] += 1
#       else
#         attributes[:count] = 1
#         result[type] = attributes
#       end
#     end
#   end
# end

# def apply_coupons(cart, coupons)
#   coupons.each do |coupon|
#     name = coupon[:item]
#     if cart[name] && cart[name][:count] >= coupon[:num]
#       if cart["#{name} W/COUPON"]
#         cart["#{name} W/COUPON"][:count] += 1
#       else
#         cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
#         cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
#       end
#       cart[name][:count] -= coupon[:num]
#     end
#   end
#   cart
# end

# def apply_clearance(cart)
#   cart.each do |name, properties|
#     if properties[:clearance]
#       updated_price = properties[:price] * 0.80
#       properties[:price] = updated_price.round(2)
#     end
#   end
#   cart
# end

# def checkout(cart, coupons)
#   consolidated_cart = consolidate_cart(cart)
#   couponed_cart = apply_coupons(consolidated_cart, coupons)
#   final_cart = apply_clearance(couponed_cart)
#   total = 0
#   final_cart.each do |name, properties|
#     total += properties[:price] * properties[:count]
#   end
#   total = total * 0.9 if total > 100
#   total
# end