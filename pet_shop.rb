def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash] 
end

def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_sold)
  return pet_shop[:admin][:pets_sold] += num_sold
end

def stock_count(pet_shop)
  count = 0
  count = pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  count = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      count.push(pet)
    end
  end
  return count
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return 
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_pet_count(customer)
  count = customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return if pet == nil ||
 customer_can_afford_pet(customer, pet) == false

  amount = pet[:price]
  add_pet_to_customer(customer, pet)
  remove_pet_by_name(pet_shop, pet)
  increase_pets_sold(pet_shop, 1)
  add_or_remove_cash(pet_shop, amount)

end