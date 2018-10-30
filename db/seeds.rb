
require_relative( "../models/transaction.rb" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require("pry-byebug")


Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


#TAGS table data -----

tag1 = Tag.new({
  "tag_name" => "Food",
  "tag_logo" => "https://mbtskoudsalg.com/images/food-clip-art-png-3.png"
})
tag1.save()

tag2 = Tag.new({
  "tag_name" => "Clothing",
  "tag_logo" => "https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/e/ed/Clothing-clipart-nriLaoT84.png/revision/latest?cb=20160905020118"
})
tag2.save()

tag3 = Tag.new({
  "tag_name" => "Furniture",
  "tag_logo" => "https://ubisafe.org/images/table-transparent-cartoon-3.png"
})
tag3.save()

#MERCHANT table data -----

merchant1 = Merchant.new({
  "merchant_name" => "Tesco",
  "merchant_logo" => "https://upload.wikimedia.org/wikipedia/en/thumb/b/b0/Tesco_Logo.svg/1280px-Tesco_Logo.svg.png"
})
merchant1.save()

merchant2 = Merchant.new({
  "merchant_name" => "Amazon",
  "merchant_logo" => "https://mbtskoudsalg.com/images/amazon-png-transparent-4.png"
})
merchant2.save()


#TRANSACTION table data -----

transaction1 = Transaction.new({
  "tags_id" => tag1.id,
  "merchants_id" => merchant1.id,
  "transaction_value" => 10
})
transaction1.save()

transaction2 = Transaction.new({
  "tags_id" => tag2.id,
  "merchants_id" => merchant2.id,
  "transaction_value" => 15
})
transaction2.save()

transaction3 = Transaction.new({
  "tags_id" => tag2.id,
  "merchants_id" => merchant1.id,
  "transaction_value" => 15
})
transaction3.save()

transaction4 = Transaction.new({
  "tags_id" => tag1.id,
  "merchants_id" => merchant2.id,
  "transaction_value" => 15
})
transaction4.save()








binding.pry
nil
