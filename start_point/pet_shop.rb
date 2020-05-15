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
    number_of_pets= pet_shop[:pets].count
    return number_of_pets
end



