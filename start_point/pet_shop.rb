require("pry")

module StockChecker
    def is_in_stock?
        self != nil
    end
end
  
class Hash
    include StockChecker
end
  
class NilClass
    include StockChecker
end


def pet_shop_name(pet_shop)
    shop_name = pet_shop[:name]
    return shop_name
end

def total_cash(pet_shop)
    shop_cash_holdings = pet_shop[:admin][:total_cash]
    return shop_cash_holdings
end

#refactor to use above function
def add_or_remove_cash(pet_shop, amount_to_add_or_remove)
    pet_shop[:admin][:total_cash] += amount_to_add_or_remove
end

def pets_sold(pet_shop)
    number_of_pets_sold = pet_shop[:admin][:pets_sold]
    return number_of_pets_sold
end

def increase_pets_sold(pet_shop, number_of_pets_to_increase_by)
    pet_shop[:admin][:pets_sold] += number_of_pets_to_increase_by
end

def stock_count(pet_shop)
    number_of_pets = pet_shop[:pets].count
    return number_of_pets
end

def pets_by_breed(pet_shop, breed)
    pets_with_matching_breed = pet_shop[:pets].filter_map{ |pet| pet if pet[:breed] == breed}
    return pets_with_matching_breed
end

def find_pet_by_name(pet_shop, pet_name)
    pets_with_matching_name = pet_shop[:pets].find{ |pet| pet[:name] == pet_name}
    return pets_with_matching_name
end

def remove_pet_by_name(pet_shop, pet_name)    
    pet_shop[:pets].delete_if{ |pet| pet[:name] == pet_name}
end

def add_pet_to_stock(pet_shop, new_pet)
    pet_shop[:pets].push(new_pet)
end

def customer_cash(customer_details)
    customer_cash_balance = customer_details[:cash]
    return customer_cash_balance
end

def remove_customer_cash(customer_details, amount_to_remove)
    customer_details[:cash] -= amount_to_remove
end

def customer_pet_count(customer_details)
    number_of_pets = customer_details[:pets].length()
    return number_of_pets
end

def add_pet_to_customer(customer_details, new_pet)
    customer_details[:pets].push(new_pet)
end

def pet_price(pet)
    pet[:price]
end

def customer_can_afford_pet(customer_details, pet_to_buy)
        customer_cash_balance = customer_cash(customer_details)
        pet_price = pet_price(pet_to_buy)
        balance_greater_or_equal_to_pet_price = pet_price <= customer_cash_balance
        return balance_greater_or_equal_to_pet_price
end

def sell_pet_to_customer(pet_shop, pet_to_buy, customer_details)
    if pet_to_buy.is_in_stock? && customer_can_afford_pet(customer_details, pet_to_buy)      
        #get pet price
        pet_price = pet_price(pet_to_buy)
        #reduce customer cash
        remove_customer_cash(customer_details, pet_price)
        #increase shop cash
        add_or_remove_cash(pet_shop, pet_price)
        # remove pet from shop
        pet_name=pet_to_buy[:name]
        remove_pet_by_name(pet_shop, pet_name)  
        # add pet to customer
        add_pet_to_customer(customer_details, pet_to_buy)
        #increase number of pets sold by one
        increase_pets_sold(pet_shop, 1)
    end
end

