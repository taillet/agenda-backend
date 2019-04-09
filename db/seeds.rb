# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Day.destroy_all
User.destroy_all
Category.destroy_all
Event.destroy_all
Note.destroy_all
ToDoItem.destroy_all

me = User.create(name:"Heloise")
d = Day.create(date:DateTime.now)
c = Category.create(name:"Interview")
s = Category.create(name:"Study")
sk = Category.create(name:"School")
td1 = ToDoItem.create(description: "This is a test to do ",priority: "High", checked: true, user:me, day:d)
td2 = ToDoItem.create(description: "This is a test to do 2", priority: "Low", checked: false, user:me, day:d)
t1int = Categorytodo.create(category: c, to_do_item: td1)
t2int = Categorytodo.create(category: c, to_do_item: td2)
note = Note.create(title:"Test Note", description:"Test test testing notes", user:me, day:d)
note1 = Note.create(title:"Test Note 2", description:"Test", user:me, day:d)
note2 = Note.create(title:"Test Note 3", description:"I have a Test today", user:me, day:d)
e1 = Event.create(title:"Test Event 1", description:"Test test testing event 1", user:me, day:d, start: DateTime.new(2019,4,3,17,5,6), end: DateTime.new(2019,2,4,19,5,6), priority:"High")
e2 = Event.create(title:"Test Event 2", checked: true,description:"Test test testing event 2", user:me, day:d,  start: DateTime.new(2019,4,3,17,5,6), end: DateTime.new(2019,2,4,19,5,6), priority:"Low")
e1int = Categoryevent.create(category: c, event: e1)
e2int = Categoryevent.create(category: c, event: e2)
e2stu = Categoryevent.create(category: s, event: e2)
noteint = Categorynote.create(category: c, note: note)
noteint1 = Categorynote.create(category: sk, note: note2)
noteint = Categorynote.create(category: s, note: note1)
