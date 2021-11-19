CSS Questions: 
==================================================================== 

1)What is CSS?
a)CSS is a standard for applying style to HTML elements. This styling includes margins, positioning, fonts, colors, and so forth. The styling can apply to the complete document or be granular and apply to a specific element. Theoretically, the use of CSS promotes the separation of content and design, allowing the designer to focus on how a Web application will look while the developer(s) concentrate on the structure and functionality.

	The main part of CSS is a rule. A rule consists of a selector (i.e., what will be styled) followed by a declaration (i.e., the style to be applied) that is broken into one or more properties and associated styles. In the following example, h1 is the selector, followed by the color property and the style of blue.

h1 {color: blue;}

2)Is CSS case-sensitive?
a)	The CSS standard is not case-sensitive, but if an XHTML doctype is used, then CSS class names will be case-sensitive in some browsers. In addition, items like font families, image URLs, and other direct references with the style sheet can be case-sensitive. To be safe, you should stick with lower-case to avoid confusion or unexpected problems.

3)What is a class?
a)A class is a style (i.e., a group of CSS attributes) that can be applied to one or more HTML elements. This means it can apply to instances of the same element or instances of different elements to which the same style can be attached. Classes are defined in CSS using a period followed by the class name. It is applied to an HTML element via the class attribute and the class name.

The following snippet shows a class defined, and then it being applied to an HTML DIV element.

.classexample {font-family: Helvetica; font-size: 20; background: black;}
<div class="classexample">....</div>

Also, you could define a style for all elements with a defined class. This is demonstrated with the following code that selects all P elements with the column class specified.

p.column {font-color: black;}


4)How do you include comments in CSS?

a)Anything placed between /* and */ in CSS is considered a comment. Comments are ignored by the browser.



5)What are different ways to apply styles to a Web page?
a)There are four ways to integrate CSS into a Web page (some consider items three and four the same):

Inline: HTML elements may have CSS applied to them via the STYLE attribute.
Embedded: CSS may be embedded in a Web page by placing the code in a STYLE element within the HEAD element.
Linked: CSS may be placed in an external file (a simple text file containing CSS) and linked via the link element.
Imported: Another way to utilize external CSS files via @import.


6)Explain the difference between visibility:hidden; and display:none; ?

a)Visibility:Hidden; - It is not visible but takes up it's original space.
Display:None; - It is hidden and takes up absolutely no space as if it was never there.


7)Name three ways to define a color in html?
 1) Hex
 2) RGB
 3) Name (ie red)

.colorMe {
	color:red;
	color:#ff0000;
	color:rgb(0,0,255);
}

8)List the main CSS style sheet properties?
a)
Background
Text
Font	
Border
Outline
Margin
Padding
List
Table

9)How is the float property implemented in CSS?
a)Floats allow an element to be positioned horizontally, allowing elements below the floated element to flow around it. Several floating elements can be placed together to make a gallery type layout.
Floats can only accept a left or right value.
e.g.)
img {
float: right;
width: 50px;
margin: 5px;
}

To prevent subsequent elements from flowing around the floated element, pass in the clear property, followed by the side you wish to disable (i.e., ‘left’, ‘right’, ‘both’).

10. What is the difference between <div> and <frame>?
a)A <div> is a generic container element for grouping and styling, whereas a <frame> creates divisions within a web page and should be used within the <frameset> tag. The use of <frame> and <frameset> are no longer popular and are now being replaced with the more flexible <iframe>, which has become popular for embedding foreign elements (ie. Youtube videos) into a page.

11)What are your favourite image replacement techniques and which do you use when? 
12)How would you approach fixing browser-specific styling issues? 
13)What techniques/processes do you use? 
14)What are the different ways to visually hide content (and make it available only for screen readers)? 
15)Have you used or implemented media queries or mobile specific layouts/CSS? 
16)List as many values for the display property that you can remember. 
17)What's the difference between inline and inline-block?  
18)What existing CSS frameworks have you used locally, or in production? How would you change/improve them?

==========================================================================================================
JS Questions:
	1) What is JavaScript? 
	 
	   Ans:JavaScript is a scripting language most often used for client-side web development. 

	2) What is the difference between JavaScript and Jscript? 
		 
	   Ans:Both JavaScript and Jscript are almost similar. JavaScript was developed by   
                      Netscape. Microsoft reverse engineered Javascript and called it JScript. 
	 
	3) Is JavaScript case sensitive? 
	 
	 Ans:Yes! 
	   A function getElementById is not the same as getElementbyID. 

	4)What is the difference between “==” and “===”? 
	 
	  Ans: 
		“==” checks equality only, 
		“===” checks for equality as well as the type. 


	5) How will you get the Checkbox status whether it is checked or not? 
	 
	Ans: 
		
		var status = document.getElementById('checkbox1').checked; 
		alert(status); 
		will return true or false. 

	6) How to create arrays in JavaScript? 
	  

	  Ans:
                      There are two ways to create array in JavaScript like other languages: 

		a) The first way to create array 
		
                        Declare Array: 
		var names = new Array(); 
		Add Elements in Array:- 
		names[0] = "Vikas"; 
		names[1] = "Ashish"; 
		names[2] = "Nikhil"; 
		

                      b) This is the second way: 

		var names = new Array("Vikas", "Ashish", "Nikhil"); 



	7) How do you change the style/class on any element using JavaScript? 
		Ans:    document.getElementById(“myText”).style.fontSize = “10"; 
		-or-			
			document.getElementById(“myText”).className = “anyclass”; 

	8) What looping structures are there in JavaScript? 
	 
	    Ans: for, while, do-while loops 

	9)What is NaN? 
		Nan is literally “Not-a-Number”. NaN usually results when either the result or one of the values in an operation is non-numeric.  Even though NaN is not a number, ‘console.log(typeof NaN === “number”);’ logs true, while NaN compared to anything else (including NaN) logs false. The only real way to test if a value is equal to NaN is with the function ‘isNaN()’ 


	10). Which symbol is used for comments in Javascript? 

		// for Single line comments and 

		/*   MultiLine Comment */ 

	11). What are all the types of Pop up boxes available in JavaScript? 

		Alert 
		Confirm and 
		Prompt 

	12). Write about the errors shown in JavaScript? 

		JavaScript gives a message if it encounters an error. The recognized errors are – 

		Load-time errors: The errors shown at the time of the page loading are counted under 		Load-time errors. These errors are encountered by the use of improper syntax, and 
                           thus are detected while the page is getting loaded. 
		Run-time errors: This is the error that comes up while the program is running. It is 
                           caused by illegal operations, for example, division of a number by zero, or trying 
                            to access a non-existent area of the memory. 
		Logic errors: It is caused by the use of syntactically correct code, which does not
                            fulfill the required task. For example, an infinite loop.

        13).What is the difference between a null value and an undefined value? 
		Null is used to assign an empty value to a variable and needs to be assigned 
                               manually. 
		Undefined values result when you declare a variable without assigning it a value.                   
                        Undefined will be the default whenever you don’t explicitly assign a value. 

       14)Explain how this works in JavaScript ?
       15)Explain AJAX in as much detail as possible? 
       16)What are some of the advantages/disadvantages of writing JavaScript code in a 
              language  that compiles to JavaScript? 
       17)What tools and techniques do you use debugging JavaScript code? 
==========================================================================================================================
GIT 
========= 
1)      What is GIT? 

GIT is a distributed version control system and source code management (SCM) system with an emphasis to handle small and large projects with speed and efficiency. 

2)      What is a repository in GIT? 

A repository contains a directory named .git, where git keeps all of its metadata for the repository. The content of the .git directory are private to git. 

3)      What is the difference between GIT and SVN? 

  The difference between GIT and SVN is 

  a)      Git is less preferred for handling extremely large files or frequently changing binary files while SVN can handle multiple projects stored in the same repository. 

  b)      GIT does not support ‘commits’ across multiple branches or tags.  Subversion allows the creation of folders at any location in the repository layout. 

  c)        Gits are unchangeable, while Subversion allows committers to treat a tag as a branch and to create multiple revisions under a tag root. 

4)      What are the advantages of using GIT? 

    a)      Data redundancy and replication 

    b)      High availability 

    c)       Only one.git directory per repository 

    d)      Superior disk utilization and network performance 

    e)      Collaboration friendly 

    f)       Any sort of projects can use GIT 


5)      What is “Staging Area” or “Index” in GIT? 

    a)Before completing the commits, it can be formatted and reviewed in an intermediate area known as ‘Staging Area’ or ‘Index’. 

6)   What is the function of ‘git config’? 

    a)The ‘git config’ command is a convenient way to set configuration options for your Git installation.  Behaviour of a repository, user info, preferences etc. can be defined through this command. 


7)   What is the purpose of branching in GIT? 
 
  a)The purpose of branching in GIT is that you can create your own branch and jump between those branches. It will allow you to go to your previous work keeping your recent work intact. 

8)   What is a ‘conflict’ in git? 

  a)A ‘conflict’ arises when the commit that has to be merged has some change in one place, and the current commit also has a change at the same place. Git will not be able to predict which change should take precedence. 

9)   How can conflict in git resolved? 

  a)To resolve the conflict in git, edit the files to fix the conflicting changes and then add the resolved files by running “git add” after that to commit the repaired merge,  run “git commit”.  Git remembers that you are in the middle of a merger, so it sets the parents of the commit correctly. 

10)   What is Subgit? Why to use Subgit? 

  a)‘Subgit’ is a tool for a smooth, stress-free SVN to Git migration.  Subgit is a solution for a company -wide migration from SVN to Git that is: 

    a)      It is much better than git-svn 

    b)      No requirement to change the infrastructure that is already placed 

    c)       Allows to use all git and all sub-version features 

    d)      Provides genuine stress –free migration experience 

11)   How can you fix a broken commit? 

    a)To fix any broken commit, you will use the command “git commit—amend”. By running this command, you can fix the broken commit message in the editor. 

12)   What is ‘bare repository’ in GIT? 

    a)To co-ordinate with the distributed development and developers team, especially when you are working on a project from multiple computers ‘Bare Repository’ is used. A bare repository comprises of a version history of your code. 

13.How do you revert a commit that has already been pushed and made public? 
a)One or more commits can be reverted through the use of git revert. This command, in essence, creates a new commit with  
  patches that cancel out the changes introduced in specific commits. In case the commit that needs to be reverted has already been published or changing the repository history is not an option, git revert can be used to revert commits. Running the following command will revert the last two commits: 
  
  git revert HEAD~2..HEAD 
 Alternatively, one can always checkout the state of a particular commit from the past, and commit it anew. 

 14.How do you squash last N commits into a single commit? 
 a)Squashing multiple commits into a single commit will overwrite history, and should be done with caution. However, this is useful when working in feature branches. To squash the last N commits of the current branch, run the following command (with {N} replaced with the number of commits that you want to squash): 

  git rebase -i HEAD~{N} 
  
  Upon running this command, an editor will open with a list of these N commit messages, one per line. Each of these lines will begin with the word “pick”. Replacing “pick” with “squash” or “s” will tell Git to combine the commit with the commit before it. To combine all N commits into one, set every commit in the list to be squash except the first one. Upon exiting the editor, and if no conflict arises, git rebase will allow you to create a new commit message for the new combined commit. 

  15.What is git bisect? How can you use it to determine the source of a (regression) bug? 
  a)Git provides a rather efficient mechanism to find bad commits. Instead of making the user try out every single commit  to find out the first one that introduced some particular issue into the code, git bisect allows the user to perform a sort of binary search on the entire history of a repository. 

    By issuing the command git bisect start, the repository enters bisect mode. After this, all you have to do is identify a bad and a good commit: 

    git bisect bad # marks the current version as bad 
    git bisect good {hash or tag} # marks the given hash or tag as good, ideally of some earlier commit 
    Once this is done, Git will then have a range of commits that it needs to explore. At every step, it will checkout a certain commit from this range, and require you to identify it as good or bad. After which the range will be effectively halved, and the whole search will require a lot less number of steps than the actual number of commits involved in the range. Once the first bad commit has been found, or the bisect mode needs to be ended, the following command can be used to exit the mode and reset the bisection state: 

    git bisect reset 

  16) What is git rebase and how can it be used to resolve conflicts in a feature branch before merge? 
  a)In simple words, git rebase allows one to move the first commit of a branch to a new starting location. For example, if a feature branch was created from master, and since then the master branch has received new commits, git rebase can be used to move the feature branch to the tip of master. The command effectively will replay the changes made in the feature branch at the tip of master, allowing conflicts to be resolved in the process. When done with care, this will allow the feature branch to be merged into master with relative ease and sometimes as a simple fast-forward operation. 
