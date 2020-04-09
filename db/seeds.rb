# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

article1 = Article.create(title: "test 2020", description: "Corona has coming")

comment1 = Comment.create(content: "Wow", owner: "P1", article_id: article1.id)
comment1 = Comment.create(content: "Really!!", owner: "P2", article_id: article1.id)
