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
# def test_add_or_remove_cash__add
#     add_or_remove_cash(@pet_shop,10)
#     cash = total_cash(@pet_shop)
#     assert_equal(1010, cash)
# end

  # def test_add_or_remove_cash__remove
  #   add_or_remove_cash(@pet_shop,-10)
  #   cash = total_cash(@pet_shop)
  #   assert_equal(990, cash)
  # end