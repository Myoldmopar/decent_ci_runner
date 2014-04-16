#!/usr/bin/env ruby

require 'fileutils'

if ARGV.length < 4
  puts "Usage: #{__FILE__} <buildfolder> <testruntrueorfalse> <githubtoken> <repositoryname> (<repositoryname> ...)"
  abort("Not enough arguments")
end

FileUtils.mkdir_p(ARGV[0])
FileUtils.cd(ARGV[0])

system("git clone https://github.com/lefticus/simple_github_ci")

while true
  puts "Updating simple_github_ci"
  system("cd simple_github_ci && git pull")
  puts "Running ci.rb"
  ci_args = ARGV[1..-1]
  system("#{RbConfig.ruby}", "simple_github_ci/ci.rb", *ci_args)
  puts "Sleeping"

  sleep(60)
end
