# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Day.destroy_all
Category.destroy_all
Note.destroy_all
ToDoItem.destroy_all
Categorytodo.destroy_all
Categorynote.destroy_all


me = User.create(name:"Heloise")
d = Day.create(date:DateTime.now)
c = Category.create(name:"Interview")
s = Category.create(name:"Study")
note = Note.create(title:"Test Note", description:"Test test testing notes", user:me, day:d)
td1 = ToDoItem.create(title:"Test To Do 1", description:"Test test testing to do be doo be doooo 1", user:me, day:d, start: DateTime.new(2019,4,3,17,5,6), end: DateTime.new(2019,2,4,19,5,6), priority:"high")
td2 = ToDoItem.create(title:"Test To Do 2", checked: true,description:"Test test testing to do be doo be doooo 2", user:me, day:d,  start: DateTime.new(2019,4,3,17,5,6), end: DateTime.new(2019,2,4,19,5,6), priority:"low")
td1int = Categorytodo.create(category: c, to_do_item: td1)
td2int = Categorytodo.create(category: c, to_do_item: td2)
td2stu = Categorytodo.create(category: s, to_do_item: td2)
noteint = Categorynote.create(category: c, note: note)
