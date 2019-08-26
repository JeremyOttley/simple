namespace :git do
  desc "let's you clone a git repo by passing username and repo"
  task :clone, :user, :repo do |t, args|
    user = args[:user]
    repo = args[:repo]
    if system "git clone git@github.com:#{user}/#{repo}.git"
      puts "Repository: #{repo} cloned successfully"
    else
      puts "There was a problem with your request, please try again later."
    end
  end
end

#ex. rake git:clone[jeremyottley,.fonts]
