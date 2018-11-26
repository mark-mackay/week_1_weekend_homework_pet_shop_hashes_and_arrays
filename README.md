# Pet shop homework

### Weekend homework to practice manipulating and interogating arrays and hashes.

##  Summary
We were provided with a spec file with test data to produce a working prototype using TDD.

## Implementation Detail


###pet_shop_name(pet_shop)
  # Takes the pet shop data structure as an argument and returns the name of the pet shop (not the pets)


###total_cash(pet_shop)
  # Takes the pet shop data structure as an argument and returns the total amount of cash in the admin hash.


###add_or_remove_cash(pet_shop, amount)
    # Takes the pet shop data structure and amount of cash as arguments and returns the updated pet shop with the amount added.


###pets_sold(pet_shop)
  # Takes the pet shop data structure as an argument and returns the total amount of pets sold in the admin hash.


###increase_pets_sold(pet_shop, amount)
  # Takes the pet shop data structure and amount of pets sold as arguments and returns the updated pet shop


###stock_count(pet_shop)
  # Takes the pet shop data structure as an argument and returns the length of the pets array which represents the number of pets.
  


###pets_by_breed(pet_shop, breed_name)
  # Takes the pet shop data structure and the type of breed as arguments and returns the array of pets of that breed if any exist.



### find_pet_by_name(pet_shop, name)
  # Takes the pet shop data structure and the name of the pet as arguments and remove_pet_by_name(pet_shop, name) returns the pet hash of that pet if it exists, otherwise it will return nil.


### remove_pet_by_name(pet_shop, name)
  # Takes the pet shop data structure and the name of the pet as arguments and
  # removes that pet from the data structure if it exists.


###add_pet_to_stock(pet_shop, pet)
  # Takes the pet shop data structure and the hash of a new pet as arguments and pushes the new pet onto the existing petshop data structure.
  


###customer_cash(customer)
  # Takes the customer hash as an argument and returns the value in their cash field.
  


###remove_customer_cash(customer, amount)
  # Takes the customer hash and amount of cash to deduct as arguments and returns the value in their cash field minus the amount.


###customer_pet_count(customer)
  # Takes the customer hash as an argument and returns the number of pets depending on the length of their pets array.

###customer_can_afford_pet(customer, pet)
  # Takes the customer hash and a pet hash as arguments and verifies the customer has enough funds to purchase the pet.


###sell_pet_to_customer(pet_shop, pet, customer)
  # Takes the pet shop, the customer hash and a pet hash as arguments and then
  # verifies the pet exists or has a non-nil value, then verifies if the customer
  # has enough funds to purchase the pet using existing methods, then if they have
  # the methods to remove the pet by name from the shop, then add the pet to the
  # customer, then take the customer's cash, increase the number of pets sold by
  # one then add the money to the pet shop's money total.