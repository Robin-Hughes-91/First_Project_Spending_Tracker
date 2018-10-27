
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
require("pry-byebug")

# Transaction.delete_all()
# Tag.delete_all()
# Merchant.delete_all()

#TAGS table data -----

tag1 = Tag.new({
  "tag_name" => "Food",
  "tag_logo" => "url link"
})
tag1.save()

tag2 = Tag.new({
  "tag_name" => "Clothing",
  "tag_logo" => "url link"
})
tag2.save()


#MERCHANT table data -----

merchant1 = Merchant.new({
  "merchant_name" => "Tesco",
  "merchant_logo" => "url link"
})
merchant1.save()

merchant2 = Merchant.new({
  "merchant_name" => "Amazon",
  "merchant_logo" => "url link"
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






binding.pry
nil
