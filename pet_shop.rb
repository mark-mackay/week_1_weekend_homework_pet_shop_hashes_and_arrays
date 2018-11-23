def pet_shop_name(pet_shop)
  # Takes the pet shop data structure as an argument and
  # returns the name of the pet shop (not the pets)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  # Takes the pet shop data structure as an argument and
  # returns the total amount of cash in the admin hash.
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
    # Takes the pet shop data structure and amount of cash as arguments and
    # returns the updated pet shop with the amount added.
    return pet_shop[:admin][:total_cash] += amount
    # Question, is this returning the entire pet shop hash or just the updated field within?
end

def pets_sold(pet_shop)
  # Takes the pet shop data structure as an argument and
  # returns the total amount of pets sold in the admin hash.
 return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  # Takes the pet shop data structure and amount of pets sold as arguments and
  # returns the updated pet shop
    return pet_shop[:admin][:pets_sold] += amount
  # Question, is this returning the entire pet shop hash or just the updated field within?
end

def stock_count(pet_shop)
  # Takes the pet shop data structure as an argument and
  # returns the length of the pets array which represents the number of pets.
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed_name)
  # Takes the pet shop data structure and the type of breed as arguments and
  # returns the array of pets of that breed if any exist.
  pets = []
pet_shop[:pets].select { | pet | pets << pet if pet[:breed] == breed_name}
  return pets
end

def find_pet_by_name(pet_shop, name)
  # Takes the pet shop data structure and the name of the pet as arguments and
  # returns the pet hash of that pet if it exists, otherwise it will return nil.
   pet = nil
   pet_shop[:pets].each  { | peta | pet = peta if peta[:name] == name }
   return pet
end

def remove_pet_by_name(pet_shop, name)
  # Takes the pet shop data structure and the name of the pet as arguments and
  # removes that pet from the data structure if it exists.
  pet_shop[:pets].each_with_index  { | pet, index | pet_shop[:pets].delete_at(index) if pet[:name] == name }
end

def add_pet_to_stock(pet_shop, pet)
  # Takes the pet shop data structure and the hash of a new pet as arguments and
  # pushes the new pet onto the existing petshop data structure.
  pet_shop[:pets] << pet
end

def customer_cash(customer)
  # Takes the customer hash as an argument and returns the value in their cash field.
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  # Takes the customer hash and amount of cash to deduct as arguments and returns
  # the value in their cash field minus the amount.
  return customer[:cash] -=  amount
end

def customer_pet_count(customer)
  # Takes the customer hash as an argument and returns the number of pets
  # depending on the length of their pets array.
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  # Takes the customer hash and a pet hash as arguments and
  # pushes the pet into their pets array.
  return customer[:pets] << pet
end

# # OPTIONAL

def customer_can_afford_pet(customer, pet)
  # Takes the customer hash and a pet hash as arguments and
  # verifies the customer has enough funds to purchase the pet.
   return customer_cash(customer) >= pet[:price] ? true : false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  # Takes the pet shop, the customer hash and a pet hash as arguments and then
  # verifies the pet exists or has a non-nil value, then verifies if the customer
  # has enough funds to purchase the pet using existing methods, then if they have
  # the methods to remove the pet by name from the shop, then add the pet to the
  # customer, then take the customer's cash, increase the number of pets sold by
  # one then add the money to the pet shop's money total.
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
