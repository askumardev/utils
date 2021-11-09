1) What is the current version of Ruby you are using?
--> SC::2.5.9, RB::2.6.5, IDR::2.6.6
2) What is the current version of Rails you are using?
--> 6.0.1.4
3) Advantages of using Ruby or Ruby On Rails compared to other languages and frameworks?
-->

4) Explain the directory structure of Rails framework?
--> File/Folder			Description
	app		It works as the remainder of this directory. Basically it organizes our application component. It holds MVC.
	app/assets	This folder contains static files required for application's front-end grouped into folders based on their type.
	app/controllers	All the controller files are stored here. A controller handles all the web requests from the user.
	app/helpers	It contains all the helper functions to assist MVC.
	app/mailers	It contains mail specific functions for the application.
	app/models	It contains the models and data stored in our application's database.
	app/views	This folder contains the display templates to fill data in our application.
	bin		It basically contains Rails script that start your app. It can also contain other scripts use to setup, upgrade or run 				the app.
	config		It configures our application's database, routes and more.
	db		It contains our current database schema and database migrations.
	lib		It contains extended module for your application.
	log		It contains application log files.
	public		It contains static files and compiled assets. This is the only folder seen by the world.
	test		It contains unit tests, other test apparatus and fixtures.
	tmp		It contains temporary files like cache and pid files.
	vendor		It contains all third-party code like vendor gems.
	Gemfile		Here all your app's gem dependencies are declared. It is mandatory as it includes Rails core gems among other gems.
	Gemfile.lock	It holds gems dependency tree including all versions for the app.
	README.md	It is a brief instruction manual for your application.
	Rakefile	It locates and loads tasks that can be run from the command line.
	config.ru	Rack configuration for Rack based servers used to start the application.
5) Explain MVC architecture ?
6) Where do you configure the database for your Rails app?
7) Where do u configure the basic configuration for your app?
8) What are the different environments which Rails supports?
9) What are the basic components of Rails framework?
10) What is the difference between the three environments of the Rails framework?
11) Where do you configure the required gems for your app?
12) What are ruby gems?
13) what are plugins?
14) What are the plugins used by you in your experience and explain?
15) What are controllers?
16) What are models?
17) What are views?
18) Where do you specify layouts or layout for your app?
19) What is the purpose of the /lib directory in Rails?
20) How to include javascript files in your view?
21) How to include CSS files in your view?
22) How to escape HTML in a view?
23) What are partials?
24) What is the difference between a partial and a template?
25) What are helpers?
26) What is the purpose of application controller?
27) I have a piece of code which should be accessed by all the controller file in the app , where do I WRITE it?
28) How are local , global, class , instance variables declared in ruby?
29) What are ruby blocks?
30) What are ruby closures?
31) What is the difference between blocks and closures in ruby?
32) What are ranges in ruby?
33) What are the different iterators available in ruby?
34) What is ActiverRecord?
35) How do you define setters and getters in ruby?
36) Does ruby support multiple inheritance?
37) What are Modules , mixins in ruby?
38) What is the difference between "require" , "load" and "include" ?
39) Does ruby have exceptional handling?, if so how ?
40) What are migrations in rails? how do you create a new migration?
41) What is the purpose of "find" in rails?
42) What are filters in rails?
43) what are the types of filters in rails?
44) What is the difference between inline and around filters in rails?
45) How do you specify a specific layout for a particular controller action?
46) What are the different access specifiers for methods in ruby ?. What is the differences between them?
47) What are associations in rails?
48) What is the difference between has_many association has_many :through association
49) What are polymorphic associations? Give an example.
50) what is STI? Give an example.
51) Where do you use counter_sql, finder_sql of activerecord?
52) What is REST? Explain
53) What are RESTFUL routes in rails?
54) What is the purpose of routing in rails?
55) What is the significance of map.resources in routes.rb file?
56) What is the proxy server you use for deployment?
57) How many mongrel instances do you use in your cluster?
58) What is cap deploy in rails?
59) What is the difference between == and === operators in ruby?
60) How do you override methods of superclass in ruby?
61) How do you overload methods in ruby?
62) Explain testing framework in rails?
63) Explain RJS?
64) How do you overcome sql injection in rails?
65) How do you send email in rails?
66) Where and how do you configure mail server settings or SMTP settings for sending emails in rails.
67) How do you set layout for an email template?
67) What is the difference between render :action =>  and redirect
68) What are helpers in Rails and why do you use them?
#--------------------------------------------------------------------------------
1. Explain in detail about  “Asset pipeline” and how do you do it in rails?
2. What is “Bundler” ? Explain the concept of bundler
3. How to convert block into Proc
4. What are named routes ? How do you use them in “views”
5. How to write “custom web­services”
6. Without looping through the collection , how do you display list of items
7. What is different between “find” and “where”
8, Suppose there is a SQL query which is not achievable by ActiveRecords or ActiveModels how do you execute that query
9. How do you identify AJAX request in HTTP(executable) request
10. Write a small example code for AJAX request made to the server with query
11. What is AJAX (Asynchronous Call)
12. How to connect multi­databases in Rails with example
13. Suppose table name in rails is “Person_table”, thus creating model & querying on it will work.? How do you make it work..??
14. In associations the “foreign_key” is different i.e. it deviates from the convention of rails as “personid” not “person_id”, how do you tell the association the right foreign key??
15. Suppose there is a form consisting of two model attributes i.e. user, product, company etc in a form then How do you validate the associated model fields??
16. how do you write migration for databases which are not supported by rails
17. How do you use “login” in rails ? How many types of methods are there ?
18. How do you do internalisation I18N in rails?
19. suppose there is the table named fish, how do you tell rails to use the table (or) if the table name is abcdef then how do you specify singular or plural?
20. which is the first file called when rails is started ?
21. how to store sessions in database?
22. Explain field_for
23. Explain accepts_nested_attributes_for
24. what is diffrence between collect and select ?
25.how do you validate uniqueness of a record by two column ?
26. Explain unAbstrusive javascript in rails ?
27. what is 1/0
--> ZeroDivisionError (divided by 0)
28. how do you do exception handling in ruby & how do you create custom exceptions in ruby ?
29. how do you submit forms remotely in rails?
30. what is duck typing in ruby with example ?
