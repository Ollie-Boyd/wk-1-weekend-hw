require("pry")

module WeeShopMethods
    #OK this was a failed experiment. My thought was that it would be nice if I could define the routes to the data all in one place. Then if the structure of the data changed in the future it would be easier to update. I had just read about modules and thought I'd try it out. 
    #I realise this is probably not the right way to do this. 
    #These getter methods work ok when I am just fetching info from the Hash and returning it to the test but they fail when we are meant to update the original Hash/Array.  
    #For example this doesn't work:  pet_shop.get_cash_holdings += amount_to_add_or_remove

    def is_in_stock?
        return self != nil
    end

    def get_name
        return self[:name]
    end

    def all_pets
        return self[:pets]
    end

    def price
        return self[:price]
    end 

    def get_cash_holdings  
        return self[:admin][:total_cash]
    end
end
  
class Hash
    include WeeShopMethods
end
  
class NilClass
    include WeeShopMethods
end





def pet_shop_name(pet_shop)
    return pet_shop.get_name
end

def total_cash(pet_shop)
    shop_cash_holdings = pet_shop.get_cash_holdings
    return shop_cash_holdings
end

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
    number_of_pets = pet_shop.all_pets.count
    return number_of_pets
end

def pets_by_breed(pet_shop, breed)
    pets_with_matching_breed = pet_shop.all_pets.filter_map{ |pet| pet if pet[:breed] == breed}
    ##or if Ruby version < 2.7
    #pet_shop.all_pets.select{ |pet| pet[:breed] == breed}
    return pets_with_matching_breed
end

def find_pet_by_name(pet_shop, pet_name_to_look_for)
    pets_with_matching_name = pet_shop.all_pets.find{ |pet| pet.get_name == pet_name_to_look_for}
    return pets_with_matching_name
end

def remove_pet_by_name(pet_shop, pet_name_to_remove)   
    pet_shop.all_pets.delete_if{ |pet| pet.get_name == pet_name_to_remove}
end

def add_pet_to_stock(pet_shop, pet_to_add_to_stock)
    pet_shop.all_pets.push(pet_to_add_to_stock)
end

def customer_cash(customer_details)
    customer_cash_balance = customer_details[:cash]
    return customer_cash_balance
end

def remove_customer_cash(customer_details, amount_to_remove)
    customer_details[:cash] -= amount_to_remove
end

def customer_pet_count(customer_details)
    number_of_pets = customer_details.all_pets.length()
    return number_of_pets
end

def add_pet_to_customer(customer_details, new_pet)
    customer_details.all_pets.push(new_pet)
end

def customer_can_afford_pet(customer_details, pet_to_buy)
        customer_cash_balance = customer_cash(customer_details)
        balance_greater_or_equal_to_pet_price = pet_to_buy.price <= customer_cash_balance
        return balance_greater_or_equal_to_pet_price
end

def sell_pet_to_customer(pet_shop, pet_to_buy, customer_details)
    if pet_to_buy.is_in_stock? && customer_can_afford_pet(customer_details, pet_to_buy)         
        pet_price = pet_to_buy.price
        #reduce customer cash
        remove_customer_cash(customer_details, pet_price)
        #increase shop cash
        add_or_remove_cash(pet_shop, pet_price)
        # remove pet from shop
        remove_pet_by_name(pet_shop, pet_to_buy.get_name)  
        # add pet to customer
        add_pet_to_customer(customer_details, pet_to_buy)
        #increase number of pets sold by one
        increase_pets_sold(pet_shop, 1)
    end
end

