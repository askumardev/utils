php artisan serve(to run the server)

php artisan

php artisan tinker(db console)

> $user = new User;
[!] Aliasing 'User' to 'App\Models\User' for this Tinker session.
= App\Models\User {#6222}

> $user->name = 'satish'
= "satish"

> $user->password = bcrypt('!password');
= "$2y$10$3j..tCecWLh1XJ2bYtyWbOoovOAXn6yvT7qVH5FwjXOH93i1xAHeO"

> $user->save();

> $user->email = 'ask@ask.com';
= "ask@ask.com"

> $user->save();
= true

> $user
App\Models\User {#6222
    name: "satish",
    #password: "$2y$10$3j..tCecWLh1XJ2bYtyWbOoovOAXn6yvT7qVH5FwjXOH93i1xAHeO",
    updated_at: "2023-07-03 11:25:25",
    created_at: "2023-07-03 11:25:25",
    email: "ask@ask.com",
    id: 2,
  }
  
 User::find(1), 
 $users = User::all(), $users->pluck('name')
 
 User::findOrFail(200)
 
 
 php artisan help make:migration
 
 php artisan make:migration create_posts_table;
 
 php artisan migrate
 
 php artisan make:model Post;
 App\Models\Post::all();
 
 App\Models\Post::count();
 
