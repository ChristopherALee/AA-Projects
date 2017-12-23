# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

u1 = User.create(username: 'chris')
u2 = User.create(username: 'omar')

aw1 = Artwork.create(title: 'chris''s artwork',
image_url: 'http://www.art.com/chris', artist_id: u1.id)
aw2 = Artwork.create(title: 'chris''s masterpiece', 
image_url: 'http://masterpiece.com/chris', artist_id: u1.id )

aw3 = Artwork.create(title: 'the omar lisa', 
image_url: 'http://www.art.com/goodart', artist_id: u2.id)

aw4 = Artwork.create(title: 'can of soup', image_url:
'http://www.artsoup.com', artist_id: u2.id)

aws1 = ArtworkShare.create(artwork_id: aw1.id,
viewer_id: u2.id)
aws2 = ArtworkShare.create(artwork_id: aw2.id,
viewer_id: u2.id)
aws3 = ArtworkShare.create(artwork_id: aw3.id,
viewer_id: u1.id)
aws4 = ArtworkShare.create(artwork_id: aw4.id,
viewer_id: u1.id)