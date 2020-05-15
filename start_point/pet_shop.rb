require("pry")

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
    pet_shop[:pets].delete_if{|pet| pet[:name] == pet_name}
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

  # def test_customer_pet_count
  #   count = customer_pet_count(@customers[0])
  #   assert_equal(0, count)
  # end
