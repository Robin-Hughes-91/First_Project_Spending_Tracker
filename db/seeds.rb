
require_relative( "../models/transaction.rb" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )


Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


#TAGS table data -----

tag1 = Tag.new({
  "tag_name" => "Food",
  "tag_logo" => "http://www.pngall.com/wp-content/uploads/2016/06/Lunch-Box-Free-Download-PNG.png",
  "tag_budget" => 100
})
tag1.save()

tag2 = Tag.new({
  "tag_name" => "Clothing",
  "tag_logo" => "https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/e/ed/Clothing-clipart-nriLaoT84.png/revision/latest?cb=20160905020118",
  "tag_budget" => 50

})
tag2.save()

tag3 = Tag.new({
  "tag_name" => "Furniture",
  "tag_logo" => "https://ubisafe.org/images/table-transparent-cartoon-3.png",
  "tag_budget" => 150

})
tag3.save()

tag4 = Tag.new({
  "tag_name" => "Education",
  "tag_logo" => "https://melbournechapter.net/images/transparent-symbols-education-2.png",
  "tag_budget" => 6000

})
tag4.save()

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

merchant3 = Merchant.new({
  "merchant_name" => "CodeClan",
  "merchant_logo" => "https://i2.wp.com/codeclan.com/wp-content/uploads/2016/05/CodeClan-Horizontal-RGB.png?fit=869%2C320&ssl=1"
})
merchant3.save()


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

transaction5 = Transaction.new({
  "tags_id" => tag4.id,
  "merchants_id" => merchant3.id,
  "transaction_value" => 1500
})
transaction5.save()

nil
