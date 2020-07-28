# Rake 

[Rake](https://github.com/ruby/rake) is a task automation tool written in Ruby. 
It is a standard part of all Ruby installs, so if you are using Jekyll, you have it.
Adding a `Rakefile` allows you to add commands to automate repetitive tasks.

This project has a very basic `Rakefile`. 
Currently it has only one command: 

- `rake deploy`, runs Jekyll command `JEKYLL_ENV=production jekyll build` to include analytics in build. 
