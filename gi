#!/usr/bin/env ruby

def underline(text)
  "\e[4m#{text}\e[0m"
end

args = ARGV.map(&:dup)

args[0][0] = '' if args[0].start_with?('t')
command = args.join(' ')

loop do
  print "Did you mean `git #{command}`? [#{underline 'Y'}es]/#{underline 'N'}o: "
  response = STDIN.gets.strip.downcase
  if 'yes'.start_with?(response)
    puts "okay! Running `git #{command}`"
    puts `git #{command}`
    exit
  elsif 'no'.start_with?(response)
    puts "Then I'm afraid I can't help you.\n"
    exit(-1)
  else
    puts "Sorry, I didn't understand that.\n\n"
  end
end
