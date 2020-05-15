

def pet_shop_name(pet_shop)
    shop_name = pet_shop[:name]
    return shop_name
end

def total_cash(pet_shop)
    shop_cash_holdings = pet_shop[:admin][:total_cash]
    return shop_cash_holdings
end


# def test_total_cash
#     sum = total_cash(@pet_shop)
#     assert_equal(1000, sum)
# end

