# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoItem.destroy_all
TodoList.destroy_all

candidate_list = [ ["Carly", "Fiorina", '1954', 'abc123', 'female'], 
	["Donald", "Trump", '1946', 'abc123', 'male'],
		["Ben", "Carson", '1951', 'abc123', 'male'],
	["Hillary", "Clinton", '1947', 'abc123', 'female']
]

candidate_list.each do |fName, lName, birthdate, password, gender|
	user1 = User.create!(username: lName, password_digest: password)
	profile1 = Profile.create!(gender: gender, birth_year: birthdate, first_name: fName, last_name: lName, user: user1)
	todolist1 = TodoList.create!(list_name: lName, list_due_date: Date.today + 1.year, user: user1)
	5.times do |n| 
		todoitem1 = TodoItem.create!(todo_list: todolist1, completed: true, due_date: todolist1.list_due_date, title: "madeupTitle #{n}", description: "made up description #{n}")
	end
     
	

	
end

  