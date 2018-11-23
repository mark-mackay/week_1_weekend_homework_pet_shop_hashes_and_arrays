def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]

end

def add_or_remove_cash(pet_shop, amount)
    return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
 return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
    return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed_name)
  pets = []
pet_shop[:pets].select { | pet | pets << pet if pet[:breed] == breed_name}
  return pets
end

def find_pet_by_name(pet_shop, name)
   pet = nil
   pet_shop[:pets].each  { | peta | pet = peta if peta[:name] == name }
   return pet
end

def remove_pet_by_name(pet_shop, name)
  # pet_shop[:pets].each_with_index { |pet, index| puts pet_shop[:pets][index] }
  pet_shop[:pets].each_with_index  { | pet, index | pet_shop[:pets].delete_at(index) if pet[:name] == name }
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets] << pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -=  amount
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  return customer[:pets] << pet
end

# # OPTIONAL

def customer_can_afford_pet(customer, pet)
   return customer_cash(customer) >= pet[:price] ? true : false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet)
          remove_pet_by_name(pet_shop, pet[:name])
          add_pet_to_customer(customer, pet)
          remove_customer_cash(customer, pet[:price])
          increase_pets_sold(pet_shop, 1)
      pet_shop[:admin][:total_cash] += pet[:price]
    end
  end
end


# #These are 'integration' tests so we want multiple asserts.
# #If one fails the entire test should fail
# def test_sell_pet_to_customer__pet_found
#   customer = @customers[0]
#   pet = find_pet_by_name(@pet_shop,"Arthur")

#   sell_pet_to_customer(@pet_shop, pet, customer)

#   assert_equal(1, customer_pet_count(customer))
#   assert_equal(1, pets_sold(@pet_shop))
#   assert_equal(100, customer_cash(customer))
#   assert_equal(1900, total_cash(@pet_shop))
# end

# def test_sell_pet_to_customer__pet_not_found
#   customer = @customers[0]
#   pet = find_pet_by_name(@pet_shop,"Dave")

#   sell_pet_to_customer(@pet_shop, pet, customer)

#   assert_equal(0, customer_pet_count(customer))
#   assert_equal(0, pets_sold(@pet_shop))
#   assert_equal(1000, customer_cash(customer))
#   assert_equal(1000, total_cash(@pet_shop))
# end

# def test_sell_pet_to_customer__insufficient_funds
#   customer = @customers[1]
#   pet = find_pet_by_name(@pet_shop,"Arthur")

#   sell_pet_to_customer(@pet_shop, pet, customer)

#   assert_equal(0, customer_pet_count(customer))
#   assert_equal(0, pets_sold(@pet_shop))
#   assert_equal(1000, customer_cash(@pet_shop))
#   assert_equal(1000, total_cash(@pet_shop))
# end
