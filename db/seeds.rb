# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s1=Student.create(first_name: "pratibha",last_name: "patil",PRN_no: "2013BCS032",branch: "Computer Science and Engineering",email: "pratibha.patil.2022@gmail.com",contact_no: 9011922022,birthdate: '9/15/1995',username: "patilpp2",password: "secret")
	
s2=Student.create(first_name: "sujata",last_name: "regoti",PRN_no: "2013BIT039",branch: "Computer Science and Engineering",email: "sujataregoti2022@gmail.com",contact_no: 9011922022,birthdate: '11/16/1995',username: "regotiss",password: "secret")

p1=Project.create(project_name: "webportal", details: "alumni portal",student_id: s1.id)
p2=Project.create(project_name: "android", details: "libapp",student_id: s1.id)
p3=Project.create(project_name: "androidapp", details: "noticeapp",student_id: s2.id)

a1=Alumni.create(first_name: "priyanka",last_name: "patil",branch: "Computer Science and Engineering",email: "priyanka.patil.@gmail.com",contact_no: 9011922022,birthdate: '9/15/1978',company: "TCS",post_in_company: "manager",area_of_interest: "machine learning",username: "patil",password_digest: "secret")

a2=Alumni.create(first_name: "jony",last_name: "mony",branch: "Electrical Engineering",email: "jonymony123@gmail.com",contact_no: 9011922022,birthdate: '1/1/1980',company: "TCS",post_in_company: "manager",area_of_interest: "machine learning",username: "jonymony123",password_digest: "password")


ProjectRequest.create(project_id: p1.id,alumni_id: a1.id,status: "false")
ProjectRequest.create(project_id: p2.id,alumni_id: a1.id,status: "false")
ProjectRequest.create(project_id: p1.id,alumni_id: a2.id,status: "false")
ProjectRequest.create(project_id: p3.id,alumni_id: a2.id,status: "false")